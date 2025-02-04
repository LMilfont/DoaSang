import 'package:equatable/equatable.dart';

class PercentualObesosPorSexo with EquatableMixin {
  PercentualObesosPorSexo({
    this.percentual_homens_obesos,
    this.percentual_mulheres_obesas,
  });

  final double? percentual_homens_obesos;
  final double? percentual_mulheres_obesas;

  @override
  List<Object?> get props => [
    percentual_homens_obesos,
    percentual_mulheres_obesas,
  ];

}