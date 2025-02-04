package com.wktech.doasang.domain.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.wktech.doasang.domain.entities.Estado;
import com.wktech.doasang.domain.entities.TipoSanguineo;

@Repository
public interface TipoSanguineoRepository extends JpaRepository<TipoSanguineo, Integer> {

	// Query customizada para retornar o tipo sanguíneo à partir da descricao.
	@Query("select t from TipoSanguineo t where t.descricao = :descricao")
	TipoSanguineo findByDescricao(@Param("descricao") String descricao);
	
}
