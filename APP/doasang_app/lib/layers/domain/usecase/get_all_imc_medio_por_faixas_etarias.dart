import 'package:doasang_app/layers/domain/entity/imc_medio_por_faixas_etarias.dart';
import 'package:doasang_app/layers/domain/repository/candidato_repository.dart';

class GetAllImcMedioPorFaixasEtarias {
  GetAllImcMedioPorFaixasEtarias({
    required CandidatoRepository repository,
  }) : _repository = repository;

  final CandidatoRepository _repository;

  Future<List<ImcMedioPorFaixasEtarias>> call() async {
    final list = await _repository.getImcMedioPorFaixasEtarias();
    return list;
  }
}