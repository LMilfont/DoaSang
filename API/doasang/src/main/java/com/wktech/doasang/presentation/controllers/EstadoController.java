package com.wktech.doasang.presentation.controllers;

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

import com.wktech.doasang.domain.entities.Estado;
import com.wktech.doasang.domain.repositories.EstadoRepository;
import com.wktech.doasang.presentation.dtos.EstadoDTO;
import com.wktech.doasang.application.helpers.Constantes;

@RestController
@RequestMapping("/estado")
public class EstadoController {

    @Autowired
    EstadoRepository estadoRepository;

    @Autowired
    ModelMapper modelMapper;

    // Recuperação de todos.
    @GetMapping()
    public ResponseEntity<?> findAll() {
        try {
            return new ResponseEntity<>(estadoRepository.findAll(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Recuperação pelo ID.
    @GetMapping("/{id}")
    public ResponseEntity<?> find(@RequestParam("id") Integer id) {
        try {
            return new ResponseEntity<>(estadoRepository.findById(id), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Inserção.
    @PostMapping()
    public ResponseEntity<?> create(@RequestBody EstadoDTO dto) {
        Integer id = null;
        String errorMessage = "";
    	try {
    		id = dto.getId();
    		if (id != null) {
    			errorMessage = "Não é preciso passar o valor do ID, uma vez que é criado automaticamente.";
    			throw new Exception();
    		}
    		
            Estado estado = modelMapper.map(dto, Estado.class);
            this.estadoRepository.saveAndFlush(estado);
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body("Estado inserido com sucesso.");
        } catch (Exception e) {
        	if (null == dto.getSigla() || dto.getSigla().toString().length() == 0) {
        		errorMessage = "O campo SIGLA é obrigatório.";
        	}
        	else if (null == dto.getDescricao() || dto.getDescricao().toString().length() == 0) {
        		errorMessage = "O campo DESCRICAO é obrigatório.";
        	}        	
        	else if (dto.getSigla().toString().length() > Constantes.TAMANHO_MAXIMO_SIGLA_ESTADO) {
        		errorMessage = "O tamanho máximo do campo SIGLA é de " + Constantes.TAMANHO_MAXIMO_SIGLA_ESTADO + " caracteres.";
        	}
        	else if (dto.getDescricao().toString().length() > Constantes.TAMANHO_MAXIMO_DESCRICAO_ESTADO) {
        		errorMessage = "O tamanho máximo do campo DESCRICAO é de " + Constantes.TAMANHO_MAXIMO_DESCRICAO_ESTADO + " caracteres.";
        	}
        	else if (errorMessage.isEmpty())
        		errorMessage = "Ocorreu um erro durante o processamento de sua requisição.";
        	        	
            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(errorMessage);
        }
    }

    // Atualização.
    @PutMapping()
    public ResponseEntity<?> update(@RequestBody EstadoDTO dto) {
    	Estado estado = null;
        try {
            estado = this.estadoRepository.findById(dto.getId()).orElseThrow();
            estado = modelMapper.map(dto, Estado.class);            
            this.estadoRepository.saveAndFlush(estado);
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body("Estado atualizado com sucesso.");
        } catch (Exception e) {
        	String errorMessage = "Ocorreu um erro durante o processamento de sua requisição.";
        	
        	if (null == dto.getId() || dto.getId().toString().length() == 0) {
        		errorMessage = "O campo ID é obrigatório.";
        	}
        	else if (null == dto.getSigla() || dto.getSigla().toString().length() == 0) {
        		errorMessage = "O campo SIGLA é obrigatório.";
        	}
        	else if (null == dto.getDescricao() || dto.getDescricao().toString().length() == 0) {
        		errorMessage = "O campo DESCRICAO é obrigatório.";
        	}        	
        	else if (dto.getSigla().toString().length() > Constantes.TAMANHO_MAXIMO_SIGLA_ESTADO) {
        		errorMessage = "O tamanho máximo do campo SIGLA é de " + Constantes.TAMANHO_MAXIMO_SIGLA_ESTADO + " caracteres.";
        	}
        	else if (dto.getDescricao().toString().length() > Constantes.TAMANHO_MAXIMO_DESCRICAO_ESTADO) {
        		errorMessage = "O tamanho máximo do campo DESCRICAO é de " + Constantes.TAMANHO_MAXIMO_DESCRICAO_ESTADO + " caracteres.";
        	}        	        	
        	else if (estado == null) {
        		errorMessage = "Não foi encontrado um estado para o ID especificado.";
        	}
        		
            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(errorMessage);
        }
    }

    // Remoção.
    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@RequestParam("id") Integer id) {
        try {
            this.estadoRepository.deleteById(id);
            return new ResponseEntity<>("Destroy Result", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
