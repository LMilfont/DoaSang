package com.wktech.doasang.domain.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wktech.doasang.application.helpers.Constantes;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
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
@Table(name = "candidato")
public class Candidato {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotEmpty(message = "Field not empty")
    @Column(name = "nome", length = Constantes.TAMANHO_MAXIMO_NOME_CANDIDATO)
    private String nome;

    @NotEmpty(message = "Field not empty")
    @Column(name = "cpf", length = Constantes.TAMANHO_MAXIMO_CPF_CANDIDATO)
    private String cpf;

    @NotEmpty(message = "Field not empty")
    @Column(name = "rg", length = Constantes.TAMANHO_MAXIMO_RG_CANDIDATO)
    private String rg;

    @Temporal(TemporalType.DATE)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy", locale = "pt-BR", timezone = "Brazil/East")
    @Column(name = "data_nasc")
    private java.sql.Date data_nasc;

    @NotEmpty(message = "Field not empty")
    @Column(name = "sexo", length = Constantes.TAMANHO_MAXIMO_SEXO_CANDIDATO)
    private String sexo;

    @NotEmpty(message = "Field not empty")
    @Column(name = "mae", length = Constantes.TAMANHO_MAXIMO_MAE_CANDIDATO)
    private String mae;

    @NotEmpty(message = "Field not empty")
    @Column(name = "pai", length = Constantes.TAMANHO_MAXIMO_PAI_CANDIDATO)
    private String pai;

    @Column(name = "email", length = Constantes.TAMANHO_MAXIMO_EMAIL_CANDIDATO)
    private String email;

    @NotEmpty(message = "Field not empty")
    @Column(name = "cep", length = Constantes.TAMANHO_MAXIMO_CEP_CANDIDATO)
    private String cep;

    @NotEmpty(message = "Field not empty")
    @Column(name = "endereco", length = Constantes.TAMANHO_MAXIMO_ENDERECO_CANDIDATO)
    private String endereco;

    @Column(name = "numero")
    private Integer numero;

    @NotEmpty(message = "Field not empty")
    @Column(name = "bairro", length = Constantes.TAMANHO_MAXIMO_BAIRRO_CANDIDATO)
    private String bairro;

    @NotEmpty(message = "Field not empty")
    @Column(name = "cidade", length = Constantes.TAMANHO_MAXIMO_CIDADE_CANDIDATO)
    private String cidade;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "estado_id")
    private Estado estado;

    @Column(name = "telefone_fixo", length = Constantes.TAMANHO_MAXIMO_TELEFONE_CANDIDATO)
    private String telefone_fixo;

    @Column(name = "celular", length = Constantes.TAMANHO_MAXIMO_CELULAR_CANDIDATO)
    private String celular;

    @Column(name = "altura", precision = Constantes.PRECISAO_ALTURA_CANDIDATO)
    private Double altura;

    @Column(name = "peso", precision = Constantes.PRECISAO_PESO_CANDIDATO)
    private Double peso;

    //@NotEmpty(message = "Field not empty")
    //@Column(name = "tipo_sanguineo", length = Constantes.TAMANHO_MAXIMO_TIPOSANGUINEO_CANDIDATO)
    //private String tipo_sanguineo;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "tipo_sanguineo_id")
    private TipoSanguineo tipo_sanguineo;
    
    
	@Override
	public String toString() {
		return "Candidato [id=" + id + ",\n nome=" + nome + ",\n cpf=" + cpf + ",\n rg=" + rg + ",\n dataNasc="
				+ data_nasc + ",\n sexo=" + sexo + ",\n mae=" + mae + ",\n pai=" + pai + ",\n email=" + email
				+ ",\n cep=" + cep + ",\n endereco=" + endereco + ",\n numero=" + numero + ",\n bairro=" + bairro
				+ ",\n cidade=" + cidade + ",\n estado=" + estado + ",\n telefoneFixo=" + telefone_fixo
				+ ",\n celular=" + celular + ",\n altura=" + altura + ",\n peso=" + peso + ",\n tipoSanguineo="
				+ tipo_sanguineo + "]";
	}

    
}
