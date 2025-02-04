import 'package:doasang_app/layers/domain/usecase/get_all_media_idade_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/presentation/providers/media_idade_por_tipo_sanguineo_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class MediaDeIdadePorTipoSanguineoPage extends StatelessWidget {
  const MediaDeIdadePorTipoSanguineoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCaseMediaIdadePorTipoSanguineo = context.read<GetAllMediaIdadePorTipoSanguineo>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MediaIdadePorTipoSanguineoChangeProvider(getAllMediaIdadePorTipoSanguineo: useCaseMediaIdadePorTipoSanguineo),
        ),
      ],
      child: const MediaDeIdadePorTipoSanguineoPageView(),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class MediaDeIdadePorTipoSanguineoPageView extends StatefulWidget {
  const MediaDeIdadePorTipoSanguineoPageView({super.key});

  @override
  State<MediaDeIdadePorTipoSanguineoPageView> createState() => _MediaDeIdadePorTipoSanguineoPageViewState();
}

class _MediaDeIdadePorTipoSanguineoPageViewState extends State<MediaDeIdadePorTipoSanguineoPageView> {
  @override
  void initState() {
    super.initState();
    context.read<MediaIdadePorTipoSanguineoChangeProvider>().fetchMediaIdadePorTipoSanguineo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 20,),
            _secondSection(),
            SizedBox(height: 30,),
          ],
        )
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
          'Média de Idade por Tipo Sanguíneo',
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

  AspectRatio _secondSection() {
    final resultado = context.select((MediaIdadePorTipoSanguineoChangeProvider h) => h.mediaIdadePorTipoSanguineo);

    try {
      double.tryParse(resultado.elementAt(0).mediaIdade.toString())?.truncateToDouble() ?? 0;
    } catch (e) {
      return AspectRatio(
        aspectRatio: 1.0,
        child: Container(

        ),
      );
    }


    String? labelTipoSangue_01 = resultado.elementAt(0).tipoSanguineo;
    double  valorTipoSangue_01 = double.tryParse(resultado.elementAt(0).mediaIdade.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangue_02 = resultado.elementAt(1).tipoSanguineo;
    double  valorTipoSangue_02 = double.tryParse(resultado.elementAt(1).mediaIdade.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangue_03 = resultado.elementAt(2).tipoSanguineo;
    double  valorTipoSangue_03 = double.tryParse(resultado.elementAt(2).mediaIdade.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangue_04 = resultado.elementAt(3).tipoSanguineo;
    double  valorTipoSangue_04 = double.tryParse(resultado.elementAt(3).mediaIdade.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangue_05 = resultado.elementAt(4).tipoSanguineo;
    double  valorTipoSangue_05 = double.tryParse(resultado.elementAt(4).mediaIdade.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangue_06 = resultado.elementAt(5).tipoSanguineo;
    double  valorTipoSangue_06 = double.tryParse(resultado.elementAt(5).mediaIdade.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangue_07 = resultado.elementAt(6).tipoSanguineo;
    double  valorTipoSangue_07 = double.tryParse(resultado.elementAt(6).mediaIdade.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangue_08 = resultado.elementAt(7).tipoSanguineo;
    double  valorTipoSangue_08 = double.tryParse(resultado.elementAt(7).mediaIdade.toString())?.truncateToDouble() ?? 0.00;

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
                        maxY: 70,
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
                              axisNameWidget: Text('Média de Idade'),
                              sideTitles: SideTitles(
                                  reservedSize: 44,
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
                              getTitlesWidget: getTitlesMediaDeIdade,
                            ),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_01, color: Colors.red)
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_02, color: Color.fromRGBO(255, 200, 200, 1))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_03, color: Colors.green)
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_04, color: Color.fromRGBO(170, 255, 170, 1))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_05, color: Colors.blue)
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_06, color: Color.fromRGBO(200, 200, 255, 1))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_07, color: Colors.orange)
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 7,
                            barRods: [
                              BarChartRodData(toY: valorTipoSangue_08, color:Color.fromRGBO(255, 185, 115, 1))
                            ],
                            showingTooltipIndicators: [0],
                          ),


                        ]
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitlesMediaDeIdade(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'A+';
        break;
      case 1:
        text = 'A-';
        break;
      case 2:
        text = 'B+';
        break;
      case 3:
        text = 'B-';
        break;
      case 4:
        text = 'AB+';
        break;
      case 5:
        text = 'AB-';
        break;
      case 6:
        text = 'O+';
        break;
      case 7:
        text = 'O-';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(text, style: style),
    );
  }

}