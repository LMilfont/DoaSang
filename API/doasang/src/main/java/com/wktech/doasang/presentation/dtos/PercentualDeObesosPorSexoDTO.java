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
public class PercentualDeObesosPorSexoDTO {
	
	private BigDecimal percentual_homens_obesos;

	private BigDecimal percentual_mulheres_obesas;

	
}