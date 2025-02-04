import 'dart:convert';

class PercentualObesosPorSexoDto {
  PercentualObesosPorSexoDto ({
    required this.percentual_homens_obesos,
    required this.percentual_mulheres_obesas
  });

  double percentual_homens_obesos;
  double percentual_mulheres_obesas;


  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory PercentualObesosPorSexoDto.fromRawJson(String str) =>
      PercentualObesosPorSexoDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory PercentualObesosPorSexoDto.fromMap(Map<String, dynamic> json) => PercentualObesosPorSexoDto(
    percentual_homens_obesos: json['percentual_homens_obesos'],
    percentual_mulheres_obesas: json['percentual_mulheres_obesas']
  );

  Map<String, dynamic> toMap() => {
    'percentual_homens_obesos' : percentual_homens_obesos,
    'percentual_mulheres_obesas' : percentual_mulheres_obesas,
  };
}