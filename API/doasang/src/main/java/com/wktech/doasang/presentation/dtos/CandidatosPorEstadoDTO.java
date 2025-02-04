package com.wktech.doasang.presentation.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CandidatosPorEstadoDTO {
	
	private String descricao;

	private Long totalCandidatos;

}