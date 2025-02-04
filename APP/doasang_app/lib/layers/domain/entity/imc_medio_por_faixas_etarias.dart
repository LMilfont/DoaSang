import 'package:equatable/equatable.dart';

class ImcMedioPorFaixasEtarias with EquatableMixin {
  ImcMedioPorFaixasEtarias({
    this.faixa,
    this.imcMedio,
  });

  final String? faixa;
  final double? imcMedio;

  @override
  List<Object?> get props => [
    faixa,
    imcMedio,
  ];

}