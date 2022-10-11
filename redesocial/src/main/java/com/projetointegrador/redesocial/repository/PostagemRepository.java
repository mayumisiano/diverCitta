package com.projetointegrador.redesocial.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.projetointegrador.redesocial.model.Postagem;

@Repository
public interface PostagemRepository extends JpaRepository <Postagem, Long>{
		public List <Postagem> findAllByTituloContainingIgnoreCase(@Param("titulo") String titulo);

}
