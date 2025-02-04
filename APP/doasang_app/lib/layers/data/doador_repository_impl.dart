import 'package:doasang_app/layers/domain/entity/doadores_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/data/source/network/api.dart';
import 'package:doasang_app/layers/domain/repository/doador_repository.dart';


class DoadorRepositoryImpl implements DoadorRepository {
  final Api _api;

  DoadorRepositoryImpl({
    required Api api,
  })  : _api = api;

  @override
  Future<List<DoadoresPorTipoSanguineo>> getDoadoresPorTipoSanguineo() async {
    final fetchedList = await _api.loadDoadoresPorTipoSanguineo();
    List<DoadoresPorTipoSanguineo> lista = fetchedList.map((dto) => DoadoresPorTipoSanguineo(tipoSanguineoReceptor: dto.tipoSanguineoReceptor, totalDoadores: dto.totalDoadores)).toList();

    return lista;
  }

}