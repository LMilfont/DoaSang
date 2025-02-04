import 'package:doasang_app/layers/domain/usecase/get_all_media_idade_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_percentual_obesos_por_sexo.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_imc_medio_por_faixas_etarias.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_doadores_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_candidatos_por_estado.dart';

class AppUsingProvider extends StatelessWidget {
  const AppUsingProvider({super.key,
    required this.getAllPercentualObesosPorSexo,
    required this.getAllMediaIdadePorTipoSanguineo,
    required this.getAllImcMedioPorFaixasEtarias,
    required this.getAllDoadoresPorTipoSanguineo,
    required this.getAllCandidatosPorEstado
  });

  final GetAllPercentualObesosPorSexo getAllPercentualObesosPorSexo;
  final GetAllMediaIdadePorTipoSanguineo getAllMediaIdadePorTipoSanguineo;
  final GetAllImcMedioPorFaixasEtarias getAllImcMedioPorFaixasEtarias;
  final GetAllDoadoresPorTipoSanguineo getAllDoadoresPorTipoSanguineo;
  final GetAllCandidatosPorEstado getAllCandidatosPorEstado;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: getAllPercentualObesosPorSexo),
        Provider.value(value: getAllMediaIdadePorTipoSanguineo),
        Provider.value(value: getAllImcMedioPorFaixasEtarias),
        Provider.value(value: getAllDoadoresPorTipoSanguineo),
        Provider.value(value: getAllCandidatosPorEstado),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}