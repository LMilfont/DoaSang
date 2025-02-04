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
@Table(name = "usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Field not empty")
    @Column(name = "username", unique = true, length = Constantes.TAMANHO_MAXIMO_USERNAME)
    private String username;

    @NotEmpty(message = "Field not empty")
    @Column(name = "password", length = Constantes.TAMANHO_MAXIMO_PASSWORD)
    private String password;
}
