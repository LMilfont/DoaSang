import 'package:equatable/equatable.dart';

class MediaDeIdadePorTipoSanguineo with EquatableMixin {
  MediaDeIdadePorTipoSanguineo({
    this.tipoSanguineo,
    this.mediaIdade,
  });

  final String? tipoSanguineo;
  final double? mediaIdade;

  @override
  List<Object?> get props => [
    tipoSanguineo,
    mediaIdade,
  ];

}