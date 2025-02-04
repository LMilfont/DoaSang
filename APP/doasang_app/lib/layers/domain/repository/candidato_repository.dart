import 'package:doasang_app/layers/domain/entity/media_de_idade_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/domain/entity/percentual_obesos_por_sexo.dart';
import '../entity/candidatos_por_estado.dart';
import '../entity/imc_medio_por_faixas_etarias.dart';

abstract class CandidatoRepository {
  Future<void> uploadCandidatos();
  Future<List<PercentualObesosPorSexo>> getPercentualObesosPorSexo();
  Future<List<MediaDeIdadePorTipoSanguineo>> getMediaIdadePorTipoSanguineo();
  Future<List<ImcMedioPorFaixasEtarias>> getImcMedioPorFaixasEtarias();
  Future<List<CandidatosPorEstado>> getCandidatosPorEstado();
}