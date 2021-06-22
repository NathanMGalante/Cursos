package br.com.nathanmg.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.nathanmg.forum.controller.dto.TopicoDto;
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
	public void cadastrar(@RequestBody TopicoForm form) {//como é um metodo post, o @RequestBody indica que não é para pegar na url e sim no corpo da requisição
		Topico topico = form.converter(cursoRepository);
		topicoRepository.save(topico);
	}
}
