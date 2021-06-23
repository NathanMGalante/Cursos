package br.com.nathanmg.forum.controller.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import br.com.nathanmg.forum.modelo.StatusTopico;
import br.com.nathanmg.forum.modelo.Topico;

public class TopicoDetalhesDto {
	
	private Long id;
	private String titulo;
	private String mensagem;
	private LocalDateTime datacriacao;
	
	private String nomeAutor;
	private StatusTopico status;
	private List<RespostaDto> respostas;
	
	public TopicoDetalhesDto(Topico topico) {
		this.id = topico.getId();
		this.titulo = topico.getTitulo();
		this.mensagem = topico.getMensagem();
		this.datacriacao = topico.getDataCriacao();
		this.nomeAutor = topico.getAutor().getNome();
		this.status = topico.getStatus();
		this.respostas = new ArrayList<>();
		this.respostas.addAll(topico.getRespostas().stream().map(RespostaDto::new).collect(Collectors.toList()));
	}

	public Long getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
	}

	public String getMensagem() {
		return mensagem;
	}

	public LocalDateTime getDatacriacao() {
		return datacriacao;
	}

	public String getNomeAutor() {
		return nomeAutor;
	}

	public StatusTopico getStatus() {
		return status;
	}

	public List<RespostaDto> getRespostas() {
		return respostas;
	}
	
}
