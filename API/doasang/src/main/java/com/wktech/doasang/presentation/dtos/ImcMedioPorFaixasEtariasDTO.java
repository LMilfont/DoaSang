package com.wktech.doasang.presentation.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImcMedioPorFaixasEtariasDTO {

	private String faixa;

	private Double imcMedio;

}