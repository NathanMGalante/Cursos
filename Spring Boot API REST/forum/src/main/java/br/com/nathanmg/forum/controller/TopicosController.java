package br.com.nathanmg.forum.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.nathanmg.forum.controller.dto.TopicoDto;
import br.com.nathanmg.forum.modelo.Curso;
import br.com.nathanmg.forum.modelo.Topico;

@RestController	//com essa alteração, não precisa adicionar o ResponseBody
public class TopicosController {

	@RequestMapping("/topicos")
	public List<TopicoDto> Lista(){
		Topico topico = new Topico("Dúvida", "Dúvida com Spring", new Curso("Spring", "Programação"));
		return TopicoDto.converter(Arrays.asList(topico, topico, topico));
	}
}
