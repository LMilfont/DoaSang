import 'dart:convert';

class MediaDeIdadePorTipoSanguineoDto {
  MediaDeIdadePorTipoSanguineoDto ({
    required this.tipoSanguineo,
    required this.mediaIdade
  });

  String tipoSanguineo;
  double mediaIdade;


  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory MediaDeIdadePorTipoSanguineoDto.fromRawJson(String str) =>
      MediaDeIdadePorTipoSanguineoDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory MediaDeIdadePorTipoSanguineoDto.fromMap(Map<String, dynamic> json) => MediaDeIdadePorTipoSanguineoDto(
    tipoSanguineo: json['tipoSanguineo'],
    mediaIdade: json['mediaIdade']
  );

  Map<String, dynamic> toMap() => {
    'tipoSanguineo' : tipoSanguineo,
    'mediaIdade' : mediaIdade,
  };
}