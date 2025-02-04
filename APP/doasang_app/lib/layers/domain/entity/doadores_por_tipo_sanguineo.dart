import 'package:equatable/equatable.dart';

class DoadoresPorTipoSanguineo with EquatableMixin {
  DoadoresPorTipoSanguineo({
    this.tipoSanguineoReceptor,
    this.tipoSanguineoDoador,
    this.totalDoadores,
  });

  final String? tipoSanguineoReceptor;
  final String? tipoSanguineoDoador;
  final int? totalDoadores;

  @override
  List<Object?> get props => [
    tipoSanguineoReceptor,
    tipoSanguineoDoador,
    totalDoadores,
  ];

}