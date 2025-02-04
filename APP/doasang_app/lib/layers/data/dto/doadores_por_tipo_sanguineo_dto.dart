import 'dart:convert';

class DoadoresPorTipoSanguineoDto {
  DoadoresPorTipoSanguineoDto ({
    required this.tipoSanguineoReceptor,
    required this.tipoSanguineoDoador,
    required this.totalDoadores
  });

  String tipoSanguineoReceptor;
  String tipoSanguineoDoador;
  int totalDoadores;


  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory DoadoresPorTipoSanguineoDto.fromRawJson(String str) =>
      DoadoresPorTipoSanguineoDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory DoadoresPorTipoSanguineoDto.fromMap(Map<String, dynamic> json) => DoadoresPorTipoSanguineoDto(
      tipoSanguineoReceptor: json['tipoSanguineoReceptor'],
      tipoSanguineoDoador: json['tipoSanguineoDoador'],
      totalDoadores: json['totalDoadores']
  );

  Map<String, dynamic> toMap() => {
    'tipoSanguineoReceptor' : tipoSanguineoReceptor,
    'tipoSanguineoDoador' : tipoSanguineoDoador,
    'totalDoadores' : totalDoadores,
  };
}