package br.com.nathanmg.forum.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.nathanmg.forum.controller.dto.TopicoDto;
import br.com.nathanmg.forum.modelo.Curso;
import br.com.nathanmg.forum.modelo.Topico;
import br.com.nathanmg.forum.repository.TopicoRepository;

@RestController	//com essa alteração, não precisa adicionar o ResponseBody
public class TopicosController {

	@Autowired
	private TopicoRepository topicoRepository;
	
	@RequestMapping("/topicos")
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
}
