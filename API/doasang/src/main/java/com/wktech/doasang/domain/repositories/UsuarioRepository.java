package com.wktech.doasang.domain.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.wktech.doasang.domain.entities.Usuario;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
	
	// Query customizada
	@Query("SELECT u FROM Usuario u WHERE u.username = :username")
	Usuario findByUsername(@Param("username") String username);

	// Query customizada
	@Query("SELECT u FROM Usuario u WHERE u.username = :username")
	Usuario loadUserByUsername(@Param("username") String username);
	
	
}
