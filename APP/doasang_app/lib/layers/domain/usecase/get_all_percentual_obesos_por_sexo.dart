import '../entity/percentual_obesos_por_sexo.dart';
import '../repository/candidato_repository.dart';

class GetAllPercentualObesosPorSexo {
  GetAllPercentualObesosPorSexo({
    required CandidatoRepository repository,
  }) : _repository = repository;

  final CandidatoRepository _repository;

  Future<List<PercentualObesosPorSexo>> call() async {
    final list = await _repository.getPercentualObesosPorSexo();
    return list;
  }
}