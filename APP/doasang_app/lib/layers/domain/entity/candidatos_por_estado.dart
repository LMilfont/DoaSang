import 'package:equatable/equatable.dart';

class CandidatosPorEstado with EquatableMixin {
  CandidatosPorEstado({
    this.descricao,
    this.totalCandidatos,
  });

  final String? descricao;
  final int? totalCandidatos;

  @override
  List<Object?> get props => [
    descricao,
    totalCandidatos,
  ];

}