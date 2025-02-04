import 'dart:convert';

class CandidatosPorEstadoDto {
  CandidatosPorEstadoDto ({
    required this.descricao,
    required this.totalCandidatos
  });

  String descricao;
  int totalCandidatos;


  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory CandidatosPorEstadoDto.fromRawJson(String str) =>
      CandidatosPorEstadoDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory CandidatosPorEstadoDto.fromMap(Map<String, dynamic> json) => CandidatosPorEstadoDto(
      descricao: json['descricao'],
      totalCandidatos: json['totalCandidatos']
  );

  Map<String, dynamic> toMap() => {
    'descricao' : descricao,
    'totalCandidatos' : totalCandidatos,
  };
}