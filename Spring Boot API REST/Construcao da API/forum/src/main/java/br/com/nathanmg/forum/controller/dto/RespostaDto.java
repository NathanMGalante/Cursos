package br.com.nathanmg.forum.controller.dto;

import java.time.LocalDateTime;

import br.com.nathanmg.forum.modelo.Resposta;
import br.com.nathanmg.forum.modelo.Topico;

public class RespostaDto {

	private Long id;
	private String mensagem;
	private LocalDateTime datacriacao;
	private String nomeAutor;
	
	public RespostaDto(Resposta resposta) {
		this.id = resposta.getId();
		this.mensagem = resposta.getMensagem();
		this.datacriacao = resposta.getDataCriacao();
		this.nomeAutor = resposta.getAutor().getNome();
	}

	public Long getId() {
		return id;
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
}
