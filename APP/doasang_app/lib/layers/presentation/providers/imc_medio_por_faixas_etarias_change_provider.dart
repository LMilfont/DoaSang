import 'package:flutter/material.dart';

import '../../domain/entity/imc_medio_por_faixas_etarias.dart';
import '../../domain/usecase/get_all_imc_medio_por_faixas_etarias.dart';

class ImcMedioPorFaixasEtariasChangeProvider extends ChangeNotifier {
  ImcMedioPorFaixasEtariasChangeProvider({
    required GetAllImcMedioPorFaixasEtarias getAllImcMedioPorFaixasEtarias,
    List<ImcMedioPorFaixasEtarias>? imcMedioPorFaixasEtarias
  })  : _getAllImcMedioPorFaixasEtarias = getAllImcMedioPorFaixasEtarias,
        _imcMedioPorFaixasEtarias = imcMedioPorFaixasEtarias ?? [];

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  final GetAllImcMedioPorFaixasEtarias _getAllImcMedioPorFaixasEtarias;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  final List<ImcMedioPorFaixasEtarias> _imcMedioPorFaixasEtarias;
  List<ImcMedioPorFaixasEtarias> get imcMedioPorFaixasEtarias => List.unmodifiable(_imcMedioPorFaixasEtarias);

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------
  Future<void> fetchImcMedioPorFaixasEtarias() async {
    final list = await _getAllImcMedioPorFaixasEtarias();
    _imcMedioPorFaixasEtarias.addAll(list);

    notifyListeners();
  }
}