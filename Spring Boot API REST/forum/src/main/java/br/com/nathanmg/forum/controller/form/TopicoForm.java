package br.com.nathanmg.forum.controller.form;

import br.com.nathanmg.forum.modelo.Curso;
import br.com.nathanmg.forum.modelo.Topico;
import br.com.nathanmg.forum.repository.CursoRepository;

public class TopicoForm {
	
	private String titulo;
	private String mensagem;
	private Curso nomeCurso;
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	public Curso getNomeCurso() {
		return nomeCurso;
	}
	public void setNomeCurso(Curso nomeCurso) {
		this.nomeCurso = nomeCurso;
	}
	public Topico converter(CursoRepository cursoRepository) {
		Curso curso = cursoRepository.findByNome(nomeCurso);
		return new Topico(titulo, mensagem, curso);
	}
}
