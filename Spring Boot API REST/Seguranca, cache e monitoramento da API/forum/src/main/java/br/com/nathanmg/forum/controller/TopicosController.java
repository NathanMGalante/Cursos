package br.com.nathanmg.forum.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import br.com.nathanmg.forum.controller.dto.TopicoDetalhesDto;
import br.com.nathanmg.forum.controller.dto.TopicoDto;
import br.com.nathanmg.forum.controller.form.AtualizarTopicoForm;
import br.com.nathanmg.forum.controller.form.TopicoForm;
import br.com.nathanmg.forum.modelo.Topico;
import br.com.nathanmg.forum.repository.CursoRepository;
import br.com.nathanmg.forum.repository.TopicoRepository;

@RestController	//com essa alteração, não precisa adicionar o ResponseBody
@RequestMapping("/topicos")
public class TopicosController {

	@Autowired
	private TopicoRepository topicoRepository;
	
	@Autowired
	private CursoRepository cursoRepository;
	
	@GetMapping				//O RequestParam indica que é um parametro da url
	@Cacheable(value = "listaDeTopicos")
	public Page<TopicoDto> Lista(
	@PageableDefault(sort = "id", direction = Direction.ASC, page = 0, size = 10) @RequestParam(required = false) String nomeCurso,
	Pageable paginacao){
		
		if(nomeCurso==null) {
			Page<Topico> topicos = topicoRepository.findAll(paginacao);
			return TopicoDto.converter(topicos);
		}
		else {
			Page<Topico> topicos = topicoRepository.findByCurso_Nome(nomeCurso, paginacao);
			return TopicoDto.converter(topicos);
		}
	}
	
	@PostMapping
	public ResponseEntity<TopicoDto> cadastrar(@RequestBody @Valid TopicoForm form, UriComponentsBuilder uriBuilder) {//como é um metodo post, o @RequestBody indica que não é para pegar na url e sim no corpo da requisição
		Topico topico = form.converter(cursoRepository);
		topicoRepository.save(topico);
		
		URI uri = uriBuilder.path("/topicos/{id}").buildAndExpand(topico.getId()).toUri();
		return ResponseEntity.created(uri).body(new TopicoDto(topico));
	}
	
	@GetMapping("/{id}")
	@Transactional
	public ResponseEntity<TopicoDetalhesDto> detalhar(@PathVariable Long id) {
		Optional<Topico> topico = topicoRepository.findById(id);
		if(topico.isPresent())
			return ResponseEntity.ok(new TopicoDetalhesDto(topico.get()));
		else
			return ResponseEntity.notFound().build();
	}
	
	@PutMapping("/{id}")	// PUT é para atualizar todo o conteudo e o PATCH é para atualizar apenas alguns campos
	@Transactional	//Efetuar o commit automático da transação, caso não ocorra uma exception e Executar o método dentro de um contexto transacional
	public ResponseEntity<TopicoDto> atualizar(@PathVariable Long id, @RequestBody @Valid AtualizarTopicoForm form) {
		Optional<Topico> verify = topicoRepository.findById(id);
		if(verify.isPresent()) {
			Topico topico = form.atualizar(id, topicoRepository);
			return ResponseEntity.ok(new TopicoDto(topico));
		}
		else
			return ResponseEntity.notFound().build();
	}
	
	@DeleteMapping("/{id}")										//deletar com base no id;
	@Transactional
	public ResponseEntity<?> remover(@PathVariable Long id){	//receber o id como parametro
		Optional<Topico> verify = topicoRepository.findById(id);
		if(verify.isPresent()) {
			topicoRepository.deleteById(id);
			return ResponseEntity.ok().build();
		}
		else
			return ResponseEntity.notFound().build();
	}
}
