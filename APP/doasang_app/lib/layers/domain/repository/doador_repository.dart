import '../entity/doadores_por_tipo_sanguineo.dart';

abstract class DoadorRepository {
  Future<List<DoadoresPorTipoSanguineo>> getDoadoresPorTipoSanguineo();
}