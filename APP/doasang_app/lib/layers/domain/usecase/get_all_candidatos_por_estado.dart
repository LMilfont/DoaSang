import 'package:doasang_app/layers/domain/entity/candidatos_por_estado.dart';
import 'package:doasang_app/layers/domain/repository/candidato_repository.dart';

class GetAllCandidatosPorEstado {
  GetAllCandidatosPorEstado({
    required CandidatoRepository repository,
  }) : _repository = repository;

  final CandidatoRepository _repository;

  Future<List<CandidatosPorEstado>> call() async {
    final list = await _repository.getCandidatosPorEstado();
    return list;
  }
}