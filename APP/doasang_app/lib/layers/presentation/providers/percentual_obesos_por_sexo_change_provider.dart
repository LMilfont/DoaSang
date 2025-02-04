import 'package:flutter/material.dart';
import 'package:doasang_app/layers/domain/entity/percentual_obesos_por_sexo.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_percentual_obesos_por_sexo.dart';

class PercentualObesosPorSexoChangeProvider extends ChangeNotifier {
  PercentualObesosPorSexoChangeProvider({
    required GetAllPercentualObesosPorSexo getAllPercentualObesosPorSexo,
    List<PercentualObesosPorSexo>? percentualObesosPorSexo
  })  : _getAllPercentualObesosPorSexo = getAllPercentualObesosPorSexo,
        _percentualObesosPorSexo = percentualObesosPorSexo ?? [];

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  final GetAllPercentualObesosPorSexo _getAllPercentualObesosPorSexo;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  final List<PercentualObesosPorSexo> _percentualObesosPorSexo;
  List<PercentualObesosPorSexo> get percentualObesosPorSexo => List.unmodifiable(_percentualObesosPorSexo);

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------
  Future<void> fetchPercentualObesosPorSexo() async {
    final list = await _getAllPercentualObesosPorSexo();
    _percentualObesosPorSexo.addAll(list);

    notifyListeners();
  }
}