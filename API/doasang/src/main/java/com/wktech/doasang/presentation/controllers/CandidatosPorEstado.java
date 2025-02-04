package com.wktech.doasang.presentation.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wktech.doasang.domain.repositories.CandidatoRepository;

@RestController
@RequestMapping("/candidatos-por-estado-controller")
public class CandidatosPorEstado {

	@Autowired
	private CandidatoRepository candidatoRepository;
	
    // Recuperação de todos.
    @GetMapping
    @Cacheable(value = "candidatos-por-estado")
    public ResponseEntity<?> findAll() {
        try {
            return new ResponseEntity<>(candidatoRepository.findAll(), HttpStatus.OK);
        } catch (Exception e) {
        	return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(e.getMessage());
        }
    }



}
