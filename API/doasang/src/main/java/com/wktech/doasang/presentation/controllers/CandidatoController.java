package com.wktech.doasang.presentation.controllers;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wktech.doasang.application.services.CandidatoService;
import com.wktech.doasang.domain.entities.Candidato;
import com.wktech.doasang.domain.repositories.CandidatoRepository;
import com.wktech.doasang.presentation.dtos.CandidatoDTO;
import com.wktech.doasang.presentation.dtos.CandidatoPayloadDTO;

@RestController
@RequestMapping("/candidato")
public class CandidatoController {

	@Autowired
	CandidatoService candidatoService;
	
    @Autowired
    CandidatoRepository candidatoRepository;

    @Autowired
    ModelMapper modelMapper;

    // Recuperação de todos.    
    @GetMapping()
    public ResponseEntity<?> findAll() {
        try {
            return new ResponseEntity<>(candidatoRepository.findAll(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Recuperação pelo ID.
    @GetMapping("/{id}")
    public ResponseEntity<?> find(@RequestParam("id") Integer id) {
        try {
            return new ResponseEntity<>(candidatoRepository.findById(id), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    // Envio do Payload (JSONArray de candidatos).
    @PostMapping(value = "/upload")
    public ResponseEntity<?> upload(@RequestBody List<CandidatoPayloadDTO> candidatos) {
        try {
        	        	
        	candidatoService.upload(candidatos);
        	
        	return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(e.getMessage());
        }
    }
    
    // Atualização.
    @PutMapping()
    public ResponseEntity<?> update(@RequestBody CandidatoDTO dto) {
        try {
            Candidato candidato = this.candidatoRepository.findById(dto.getId()).orElseThrow();

            candidato = modelMapper.map(dto, Candidato.class);

            this.candidatoRepository.saveAndFlush(candidato);
            return new ResponseEntity<>(candidato, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Remoção.
    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@RequestParam("id") Integer id) {
        try {
            this.candidatoRepository.deleteById(id);
            return new ResponseEntity<>("Destroy Result", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
        
}
