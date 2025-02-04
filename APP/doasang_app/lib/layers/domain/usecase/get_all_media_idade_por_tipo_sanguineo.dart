import 'package:doasang_app/layers/domain/entity/media_de_idade_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/domain/repository/candidato_repository.dart';

class GetAllMediaIdadePorTipoSanguineo {
  GetAllMediaIdadePorTipoSanguineo({
    required CandidatoRepository repository,
  }) : _repository = repository;

  final CandidatoRepository _repository;

  Future<List<MediaDeIdadePorTipoSanguineo>> call() async {
    final list = await _repository.getMediaIdadePorTipoSanguineo();
    return list;
  }
}