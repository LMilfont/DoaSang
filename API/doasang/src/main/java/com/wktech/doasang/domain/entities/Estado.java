package com.wktech.doasang.domain.entities;

import com.wktech.doasang.application.helpers.Constantes;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "estado")
public class Estado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotEmpty(message = "Field not empty")
    @Column(name = "sigla", length = Constantes.TAMANHO_MAXIMO_SIGLA_ESTADO)
    private String sigla;

    @NotEmpty(message = "Field not empty")
    @Column(name = "descricao", length = Constantes.TAMANHO_MAXIMO_DESCRICAO_ESTADO)
    private String descricao;

}
