import 'package:flutter/material.dart';
import '../../domain/entity/doadores_por_tipo_sanguineo.dart';
import '../../domain/usecase/get_all_doadores_por_tipo_sanguineo.dart';

class DoadoresPorTipoSanguineoChangeProvider extends ChangeNotifier {
  DoadoresPorTipoSanguineoChangeProvider({
    required GetAllDoadoresPorTipoSanguineo getAllDoadoresPorTipoSanguineo,
    List<DoadoresPorTipoSanguineo>? doadoresPorTipoSanguineo
  })  : _getAllDoadoresPorTipoSanguineo = getAllDoadoresPorTipoSanguineo,
        _doadoresPorTipoSanguineo = doadoresPorTipoSanguineo ?? [];

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  final GetAllDoadoresPorTipoSanguineo _getAllDoadoresPorTipoSanguineo;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  final List<DoadoresPorTipoSanguineo> _doadoresPorTipoSanguineo;
  List<DoadoresPorTipoSanguineo> get doadoresPorTipoSanguineo => List.unmodifiable(_doadoresPorTipoSanguineo);

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------
  Future<void> fetchDoadoresPorTipoSanguineo() async {
    final list = await _getAllDoadoresPorTipoSanguineo();
    _doadoresPorTipoSanguineo.addAll(list);

    notifyListeners();
  }
}