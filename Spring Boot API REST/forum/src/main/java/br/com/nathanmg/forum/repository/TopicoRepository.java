package br.com.nathanmg.forum.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.nathanmg.forum.modelo.Topico;

public interface TopicoRepository extends JpaRepository<Topico,Long> {

}
