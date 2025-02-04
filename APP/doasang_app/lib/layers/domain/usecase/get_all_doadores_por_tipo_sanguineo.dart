import 'package:doasang_app/layers/domain/entity/doadores_por_tipo_sanguineo.dart';
import '../repository/doador_repository.dart';

class GetAllDoadoresPorTipoSanguineo {
  GetAllDoadoresPorTipoSanguineo({
    required DoadorRepository repository,
  }) : _repository = repository;

  final DoadorRepository _repository;

  Future<List<DoadoresPorTipoSanguineo>> call() async {
    final list = await _repository.getDoadoresPorTipoSanguineo();
    return list;
  }
}