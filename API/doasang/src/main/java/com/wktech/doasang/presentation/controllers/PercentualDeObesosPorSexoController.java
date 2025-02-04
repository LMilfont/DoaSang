package com.wktech.doasang.presentation.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wktech.doasang.infrastructure.utils.TransformadorDTO;
import com.wktech.doasang.presentation.dtos.PercentualDeObesosPorSexoDTO;
import com.wktech.doasang.domain.repositories.CandidatoRepository;

@RestController
@RequestMapping("/percentual-de-obesos-por-sexo-controller")
public class PercentualDeObesosPorSexoController {

	@Autowired
	private CandidatoRepository candidatoRepository;
	
    // Recuperação de todos.
    @GetMapping()
    @Cacheable(value = "percentual-de-obesos-por-sexo")
    public ResponseEntity<?> findAll() {
        try {
            List<PercentualDeObesosPorSexoDTO> lista = TransformadorDTO.transformar(this.candidatoRepository.findPercentualDeObesosPorSexo(), PercentualDeObesosPorSexoDTO.class) ;
            return new ResponseEntity<>(lista, HttpStatus.OK);
        } catch (Exception e) {
        	return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(e.getMessage());
        }
    }


}
