import 'package:flutter/material.dart';
import '../../domain/entity/candidatos_por_estado.dart';
import '../../domain/usecase/get_all_candidatos_por_estado.dart';

class CandidatosPorEstadoChangeProvider extends ChangeNotifier {
  CandidatosPorEstadoChangeProvider({
    required GetAllCandidatosPorEstado getAllCandidatosPorEstado,
    List<CandidatosPorEstado>? candidatosPorEstado
  })  : _getAllCandidatosPorEstado = getAllCandidatosPorEstado,
        _candidatosPorEstado = candidatosPorEstado ?? [];

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  final GetAllCandidatosPorEstado _getAllCandidatosPorEstado;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  final List<CandidatosPorEstado> _candidatosPorEstado;
  List<CandidatosPorEstado> get candidatosPorEstado => List.unmodifiable(_candidatosPorEstado);

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------
  Future<void> fetchCandidatosPorEstado() async {
    final list = await _getAllCandidatosPorEstado();
    _candidatosPorEstado.addAll(list);

    notifyListeners();
  }
}