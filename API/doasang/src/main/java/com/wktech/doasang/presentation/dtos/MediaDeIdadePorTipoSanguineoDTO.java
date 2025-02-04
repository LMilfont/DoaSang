package com.wktech.doasang.presentation.dtos;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MediaDeIdadePorTipoSanguineoDTO{

	private String tipoSanguineo;
	
	private BigDecimal mediaIdade;

}