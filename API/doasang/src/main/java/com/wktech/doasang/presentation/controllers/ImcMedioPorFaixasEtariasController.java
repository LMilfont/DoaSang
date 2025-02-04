package com.wktech.doasang.presentation.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wktech.doasang.domain.repositories.CandidatoRepository;
import com.wktech.doasang.infrastructure.utils.TransformadorDTO;
import com.wktech.doasang.presentation.dtos.ImcMedioPorFaixasEtariasDTO;

@RestController
@RequestMapping("/imc-medio-por-faixas-etarias-controller")
public class ImcMedioPorFaixasEtariasController {

	@Autowired
	private CandidatoRepository candidatoRepository;
	
    // Recuperação de todos.
    @GetMapping()
    @Cacheable(value = "imc-medio-por-faixas-etarias")
    public ResponseEntity<?> findAll() {
        try {
            List<ImcMedioPorFaixasEtariasDTO> lista = TransformadorDTO.transformar(this.candidatoRepository.findImcMedioPorFaixasEtarias(), ImcMedioPorFaixasEtariasDTO.class) ;
            return new ResponseEntity<>(lista, HttpStatus.OK);
        } catch (Exception e) {
        	return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(e.getMessage());
        }
    }



}
