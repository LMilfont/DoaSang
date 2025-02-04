import 'package:doasang_app/layers/domain/usecase/get_all_imc_medio_por_faixas_etarias.dart';
import 'package:doasang_app/layers/presentation/providers/imc_medio_por_faixas_etarias_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class ImcMedioPorFaixasEtariasPage extends StatelessWidget {
  const ImcMedioPorFaixasEtariasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCaseImcMedioPorFaixasEtarias = context.read<GetAllImcMedioPorFaixasEtarias>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImcMedioPorFaixasEtariasChangeProvider(getAllImcMedioPorFaixasEtarias: useCaseImcMedioPorFaixasEtarias),
        ),
      ],
      child: const ImcMedioPorFaixasEtariasPageView(),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class ImcMedioPorFaixasEtariasPageView extends StatefulWidget {
  const ImcMedioPorFaixasEtariasPageView({super.key});

  @override
  State<ImcMedioPorFaixasEtariasPageView> createState() => _ImcMedioPorFaixasEtariasPageViewState();
}

class _ImcMedioPorFaixasEtariasPageViewState extends State<ImcMedioPorFaixasEtariasPageView> {
  @override
  void initState() {
    super.initState();
    context.read<ImcMedioPorFaixasEtariasChangeProvider>().fetchImcMedioPorFaixasEtarias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 20,),
            _thirdSection(),
          ],
        )
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
          'IMC Médio por Faixas Etárias',
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

  AspectRatio _thirdSection() {
    final resultado = context.select((ImcMedioPorFaixasEtariasChangeProvider h) => h.imcMedioPorFaixasEtarias);

    try {
      double.tryParse(resultado.elementAt(0).imcMedio.toString())?.truncateToDouble() ?? 0;
    } catch (e) {
      return AspectRatio(
        aspectRatio: 1.0,
        child: Container(

        ),
      );
    }

    String? labelFaixa_01 = resultado.elementAt(0).faixa;
    double  valorFaixa_01 = double.tryParse(resultado.elementAt(0).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_02 = resultado.elementAt(1).faixa;
    double  valorFaixa_02 = double.tryParse(resultado.elementAt(1).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_03 = resultado.elementAt(2).faixa;
    double  valorFaixa_03 = double.tryParse(resultado.elementAt(2).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_04 = resultado.elementAt(3).faixa;
    double  valorFaixa_04 = double.tryParse(resultado.elementAt(3).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_05 = resultado.elementAt(4).faixa;
    double  valorFaixa_05 = double.tryParse(resultado.elementAt(4).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_06 = resultado.elementAt(5).faixa;
    double  valorFaixa_06 = double.tryParse(resultado.elementAt(5).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_07 = resultado.elementAt(6).faixa;
    double  valorFaixa_07 = double.tryParse(resultado.elementAt(6).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_08 = resultado.elementAt(7).faixa;
    double  valorFaixa_08 = double.tryParse(resultado.elementAt(7).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_09 = resultado.elementAt(8).faixa;
    double  valorFaixa_09 = double.tryParse(resultado.elementAt(8).imcMedio.toString())?.truncateToDouble() ?? 0;
    String? labelFaixa_10 = resultado.elementAt(9).faixa;
    double  valorFaixa_10 = double.tryParse(resultado.elementAt(9).imcMedio.toString())?.truncateToDouble() ?? 0;

    return AspectRatio(
      aspectRatio: 1.0,
      child: Column(
        children: <Widget>
        [
          Expanded(
            child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: BarChart(
                    BarChartData(
                      maxY: 35,
                      barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipColor: (group) => Colors.transparent,
                            tooltipPadding: EdgeInsets.zero,
                            tooltipMargin: 8,
                          )

                      ),
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(
                            axisNameWidget: Text('IMC Médio'),
                            sideTitles: SideTitles(
                                reservedSize: 30,
                                showTitles: true,
                                interval: 10
                            )
                        ),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: false
                            )
                        ),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: false
                            )
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: getTitlesImcMedio,
                          ),
                        ),
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_01, color: Colors.blueAccent)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_02, color: Colors.lightGreen)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_03, color: Colors.green)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_04, color: Colors.yellow)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_05, color: Colors.blue)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_06, color: Colors.deepOrange)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_07, color: Colors.red)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 7,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_08, color: Colors.deepPurple)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 8,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_09, color: Colors.purpleAccent)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 9,
                          barRods: [
                            BarChartRodData(toY: valorFaixa_10, color: Colors.black54)
                          ],
                          showingTooltipIndicators: [0],
                        ),
                      ],
                      extraLinesData: ExtraLinesData(
                        horizontalLines: [
                          HorizontalLine(
                            y: 30,
                            color: Colors.red,
                            strokeWidth: 2,
                            dashArray: [8, 4],
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );

  }

  Widget getTitlesImcMedio(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0-10';
        break;
      case 1:
        text = '11-20';
        break;
      case 2:
        text = '21-30';
        break;
      case 3:
        text = '31-40';
        break;
      case 4:
        text = '41-50';
        break;
      case 5:
        text = '51-60';
        break;
      case 6:
        text = '61-70';
        break;
      case 7:
        text = '71-80';
        break;
      case 8:
        text = '81-90';
        break;
      case 9:
        text = '91-100';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Transform.rotate(
        angle: -0.78,
        child: Text(text, style: style),
      ),
    );
  }

}