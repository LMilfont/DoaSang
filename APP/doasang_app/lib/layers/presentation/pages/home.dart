import 'package:doasang_app/layers/presentation/pages/doadores_por_tipo_sanguineo_page.dart';
import 'package:doasang_app/layers/presentation/pages/imc_medio_por_faixas_etarias_page.dart';
import 'package:doasang_app/layers/presentation/pages/percentual_obesos_por_sexo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'candidatos_por_estado_page.dart';
import 'media_idade_por_tipo_sanguineo_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  int index = 0;
final screens = [
  PercentualObesosPorSexoPage(),
  MediaDeIdadePorTipoSanguineoPage(),
  ImcMedioPorFaixasEtariasPage(),
  DoadoresPorTipoSanguineoPage(),
  CandidatosPorEstadoPage(),
];

  @override
  Widget build(BuildContext build) => Scaffold(
  body: screens[index],
    bottomNavigationBar: NavigationBar(
      selectedIndex: index,
        onDestinationSelected: (index) =>
        setState(() => this.index = index),
        destinations: [
          NavigationDestination(icon: Icon(Icons.scale_outlined), label: 'Obesos'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Média'),
          NavigationDestination(icon: Icon(Icons.multiline_chart), label: 'IMC'),
          NavigationDestination(icon: Icon(Icons.accessibility_new_outlined), label: 'Doadores'),
          NavigationDestination(icon: Icon(Icons.account_circle_outlined), label: 'Candidatos'),
        ])
  );
}

