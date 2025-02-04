import 'package:doasang_app/layers/domain/entity/candidatos_por_estado.dart';
import 'package:doasang_app/layers/domain/entity/percentual_obesos_por_sexo.dart';
import 'package:doasang_app/layers/domain/entity/media_de_idade_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/data/source/network/api.dart';
import 'package:doasang_app/layers/domain/repository/candidato_repository.dart';

import '../domain/entity/imc_medio_por_faixas_etarias.dart';

class CandidatoRepositoryImpl implements CandidatoRepository {
  final Api _api;

  CandidatoRepositoryImpl({
    required Api api,
  })  : _api = api;

  @override
  Future<void> uploadCandidatos() async {
  }

  @override
  Future<List<PercentualObesosPorSexo>> getPercentualObesosPorSexo() async {
    final fetchedList = await _api.loadPercentualObesosPorSexo();
    List<PercentualObesosPorSexo> lista = fetchedList.map((dto) => PercentualObesosPorSexo(percentual_homens_obesos: dto.percentual_homens_obesos, percentual_mulheres_obesas: dto.percentual_mulheres_obesas)).toList();

    return lista;
  }

  @override
  Future<List<MediaDeIdadePorTipoSanguineo>> getMediaIdadePorTipoSanguineo() async {
    final fetchedList = await _api.loadMediaDeIdadePorTipoSanguineo();
    List<MediaDeIdadePorTipoSanguineo> lista = fetchedList.map((dto) => MediaDeIdadePorTipoSanguineo(tipoSanguineo: dto.tipoSanguineo, mediaIdade: dto.mediaIdade)).toList();

    return lista;
  }

  @override
  Future<List<ImcMedioPorFaixasEtarias>> getImcMedioPorFaixasEtarias() async {
    final fetchedList = await _api.loadImcMedioPorFaixasEtarias();
    List<ImcMedioPorFaixasEtarias> lista = fetchedList.map((dto) => ImcMedioPorFaixasEtarias(faixa: dto.faixa, imcMedio: dto.imcMedio)).toList();

    return lista;
  }

  @override
  Future<List<CandidatosPorEstado>> getCandidatosPorEstado() async {
    final fetchedList = await _api.loadCandidatosPorEstado();
    List<CandidatosPorEstado> lista = fetchedList.map((dto) => CandidatosPorEstado(descricao: dto.descricao, totalCandidatos: dto.totalCandidatos)).toList();

    return lista;
  }

}