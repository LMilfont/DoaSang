import 'package:doasang_app/layers/domain/usecase/get_all_candidatos_por_estado.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_doadores_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_imc_medio_por_faixas_etarias.dart';
import 'package:flutter/material.dart';
import 'package:doasang_app/layers/data/candidato_repository_impl.dart';
import 'package:doasang_app/layers/data/source/network/api.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_percentual_obesos_por_sexo.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_media_idade_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/presentation/app_using_provider.dart';

import '../application/helpers/app_config.dart';
import '../data/doador_repository_impl.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late GetAllPercentualObesosPorSexo _getAllPercentualObesosPorSexo;
  late GetAllMediaIdadePorTipoSanguineo _getAllMediaIdadePorTipoSanguineo;
  late GetAllImcMedioPorFaixasEtarias _getAllImcMedioPorFaixasEtarias;
  late GetAllDoadoresPorTipoSanguineo _getAllDoadoresPorTipoSanguineo;
  late GetAllCandidatosPorEstado _getAllCandidatosPorEstado;
  var themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();

    final api = ApiImpl();
    final candidatoRepo = CandidatoRepositoryImpl(api: api);
    final doadorRepo = DoadorRepositoryImpl(api: api);

    _getAllPercentualObesosPorSexo = GetAllPercentualObesosPorSexo(repository: candidatoRepo);
    _getAllMediaIdadePorTipoSanguineo = GetAllMediaIdadePorTipoSanguineo(repository: candidatoRepo);
    _getAllImcMedioPorFaixasEtarias = GetAllImcMedioPorFaixasEtarias(repository: candidatoRepo);
    _getAllDoadoresPorTipoSanguineo = GetAllDoadoresPorTipoSanguineo(repository: doadorRepo);
    _getAllCandidatosPorEstado = GetAllCandidatosPorEstado(repository: candidatoRepo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Transform.translate(
                offset: const Offset(10, 0),
                child: Text(
                  '$APPLICATION_TITLE',
                ),
              ),
            ),
            body: _getAppUsing()
          );
        },
      ),
    );
  }

  Widget _getAppUsing() {
    return AppUsingProvider(
        getAllPercentualObesosPorSexo: _getAllPercentualObesosPorSexo,
        getAllMediaIdadePorTipoSanguineo: _getAllMediaIdadePorTipoSanguineo,
        getAllImcMedioPorFaixasEtarias: _getAllImcMedioPorFaixasEtarias,
        getAllDoadoresPorTipoSanguineo: _getAllDoadoresPorTipoSanguineo,
        getAllCandidatosPorEstado: _getAllCandidatosPorEstado

    );
  }

}