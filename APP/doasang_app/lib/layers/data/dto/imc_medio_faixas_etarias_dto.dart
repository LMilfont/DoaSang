import 'dart:convert';

class ImcMedioPorFaixasEtariasDto {
  ImcMedioPorFaixasEtariasDto ({
    required this.faixa,
    required this.imcMedio
  });

  String faixa;
  double imcMedio;


  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory ImcMedioPorFaixasEtariasDto.fromRawJson(String str) =>
      ImcMedioPorFaixasEtariasDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory ImcMedioPorFaixasEtariasDto.fromMap(Map<String, dynamic> json) => ImcMedioPorFaixasEtariasDto(
    faixa: json['faixa'],
    imcMedio: json['imcMedio']
  );

  Map<String, dynamic> toMap() => {
    'faixa' : faixa,
    'imcMedio' : imcMedio,
  };
}