import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_percentual_obesos_por_sexo.dart';
import 'package:doasang_app/layers/presentation/providers/percentual_obesos_por_sexo_change_provider.dart';
import '../../application/helpers/indicator.dart';
import 'package:fl_chart/fl_chart.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class PercentualObesosPorSexoPage extends StatelessWidget {
  const PercentualObesosPorSexoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCasePercentualDeObesosPorSexo = context.read<GetAllPercentualObesosPorSexo>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PercentualObesosPorSexoChangeProvider(getAllPercentualObesosPorSexo: useCasePercentualDeObesosPorSexo),
        ),
      ],
      child: const PercentualObesosPorSexoPageView(),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class PercentualObesosPorSexoPageView extends StatefulWidget {
  const PercentualObesosPorSexoPageView({super.key});

  @override
  State<PercentualObesosPorSexoPageView> createState() => _PercentualObesosPorSexoPageViewState();
}

class _PercentualObesosPorSexoPageViewState extends State<PercentualObesosPorSexoPageView> {
  @override
  void initState() {
    super.initState();

    context.read<PercentualObesosPorSexoChangeProvider>().fetchPercentualObesosPorSexo();
  }

  @override
  Widget build(BuildContext context) {
    final resultado = context.select((PercentualObesosPorSexoChangeProvider h) => h.percentualObesosPorSexo);

    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 20,),
            _firstSection(resultado),
            SizedBox(height: 30,),
          ],
        )
    );

  }

  AppBar appBar() {
    return AppBar(
      title: Text(
          'Obesos por Sexo (%)',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
          )
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    );
  }

  AspectRatio _firstSection(resultado) {
    const pieCharttextStyle = const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18
    );

    try {
      double percent_obesos_M = double.tryParse(resultado.elementAt(0).percentual_homens_obesos.toString()) ?? 0.00;
    } catch (e) {
      return AspectRatio(
        aspectRatio: 1.0,
        child: Container(

        ),
      );
    }

    double percent_obesos_M = double.tryParse(resultado.elementAt(0).percentual_homens_obesos.toString()) ?? 0.00;
    double percent_obesos_F = double.tryParse(resultado.elementAt(0).percentual_mulheres_obesas.toString()) ?? 0.00;
    double percent_adequados = 100 -(percent_obesos_M + percent_obesos_F);
    return AspectRatio(
      aspectRatio: 1.0,
      child: Column(
          children: <Widget>
          [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(value: percent_obesos_M, color: Colors.blue, radius: 80,
                          showTitle: true,
                          titleStyle: pieCharttextStyle,
                          title: percent_obesos_M.toString() + '%'
                      ),
                      PieChartSectionData(value: percent_obesos_F, color: Colors.pinkAccent, radius: 80,
                          showTitle: true,
                          titleStyle: pieCharttextStyle,
                          title: percent_obesos_F.toString() + '%'
                      ),
                      PieChartSectionData(value: percent_adequados, color: Colors.green, radius: 80,
                          showTitle: true,
                          titleStyle: pieCharttextStyle,
                          title: percent_adequados.toString() + '%'
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Indicator(
                  color: Colors.blue,
                  text: 'Homens',
                  isSquare: true,
                ),
                Indicator(
                  color: Colors.pinkAccent,
                  text: 'Mulheres',
                  isSquare: true,
                ),
                Indicator(
                  color: Colors.green,
                  text: 'Demais',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ]
      ),
    );
  }


}