package br.com.nathanmg.forum.controller;

import java.net.URI;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping
	public List<TopicoDto> Lista( String nomeCurso){
		if(nomeCurso==null) {
			List<Topico> topicos = topicoRepository.findAll();
			return TopicoDto.converter(topicos);
		}
		else {
			List<Topico> topicos = topicoRepository.findByCurso_Nome(nomeCurso);
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
	public TopicoDetalhesDto detalhar(@PathVariable Long id) {
		Topico topico = topicoRepository.getOne(id);
		return new TopicoDetalhesDto(topico);
	}
	
	@PutMapping("/{id}")	// PUT é para atualizar todo o conteudo e o PATCH é para atualizar apenas alguns campos
	@Transactional	//Efetuar o commit automático da transação, caso não ocorra uma exception e Executar o método dentro de um contexto transacional
	public ResponseEntity<TopicoDto> atualizar(@PathVariable Long id, @RequestBody @Valid AtualizarTopicoForm form) {
		Topico topico = form.atualizar(id, topicoRepository);
		
		return ResponseEntity.ok(new TopicoDto(topico));
	}
	
	@DeleteMapping("/{id}")										//deletar com base no id;
	@Transactional
	public ResponseEntity<?> remover(@PathVariable Long id){	//receber o id como parametro
		topicoRepository.deleteById(id);						//excluir do banco de dados
		return ResponseEntity.ok().build();						//devolve como 200.
	}
}
