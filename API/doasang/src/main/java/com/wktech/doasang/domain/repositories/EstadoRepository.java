package com.wktech.doasang.domain.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.wktech.doasang.domain.entities.Estado;

@Repository
public interface EstadoRepository extends JpaRepository<Estado, Integer> {

	// Query customizada para retornar um estado à partir de uma sigla.
	@Query("select e from Estado e where e.sigla = :sigla")
	Estado findBySigla(@Param("sigla") String sigla);
	
}
