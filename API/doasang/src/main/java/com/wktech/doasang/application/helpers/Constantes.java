package com.wktech.doasang.application.helpers;

public final class Constantes {
   // Estado.
   public static final int TAMANHO_MAXIMO_SIGLA_ESTADO = 2;
   public static final int TAMANHO_MAXIMO_DESCRICAO_ESTADO = 50;
  
   // Candidato.
   public static final int TAMANHO_MAXIMO_NOME_CANDIDATO = 100;
   public static final int TAMANHO_MAXIMO_CPF_CANDIDATO = 25;
   public static final int TAMANHO_MAXIMO_RG_CANDIDATO = 25;
   public static final int TAMANHO_MAXIMO_SEXO_CANDIDATO = 1;
   public static final int TAMANHO_MAXIMO_MAE_CANDIDATO = 100;
   public static final int TAMANHO_MAXIMO_PAI_CANDIDATO = 100;
   public static final int TAMANHO_MAXIMO_EMAIL_CANDIDATO = 100;
   public static final int TAMANHO_MAXIMO_CEP_CANDIDATO = 15;
   public static final int TAMANHO_MAXIMO_ENDERECO_CANDIDATO = 100;
   public static final int TAMANHO_MAXIMO_BAIRRO_CANDIDATO = 70;
   public static final int TAMANHO_MAXIMO_CIDADE_CANDIDATO = 70;
   public static final int TAMANHO_MAXIMO_TELEFONE_CANDIDATO = 25;
   public static final int TAMANHO_MAXIMO_CELULAR_CANDIDATO = 25;
   public static final int TAMANHO_MAXIMO_TIPOSANGUINEO_CANDIDATO = 5;
   public static final int PRECISAO_ALTURA_CANDIDATO = 5;
   public static final int PRECISAO_PESO_CANDIDATO = 5;
   
   public static final int TAMANHO_MAXIMO_DESCRICAO_TIPOSANGUINEO = 5;
   
   public static final int TAMANHO_MAXIMO_USERNAME = 30;
   public static final int TAMANHO_MAXIMO_PASSWORD = 60; // BCryptPassword ocupa 60 chars.  
   
   private Constantes() {
	   // Para prevenir instanciamento.
   }
}
