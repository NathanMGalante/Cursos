package br.com.nathanmg.forum.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nathanmg.forum.modelo.Curso;

public interface CursoRepository extends JpaRepository<Curso, Long> {

	Curso findByNome(Curso nomeCurso);

}
