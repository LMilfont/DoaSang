import 'package:doasang_app/layers/domain/usecase/get_all_candidatos_por_estado.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/candidatos_por_estado_change_provider.dart';
import 'package:fl_chart/fl_chart.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class CandidatosPorEstadoPage extends StatelessWidget {
  const CandidatosPorEstadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCaseCandidatosPorEstado = context.read<GetAllCandidatosPorEstado>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CandidatosPorEstadoChangeProvider(getAllCandidatosPorEstado: useCaseCandidatosPorEstado),
        ),
      ],
      child: const CandidatosPorEstadoPageView(),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class CandidatosPorEstadoPageView extends StatefulWidget {
  const CandidatosPorEstadoPageView({super.key});

  @override
  State<CandidatosPorEstadoPageView> createState() => _CandidatosPorEstadoPageViewState();
}

class _CandidatosPorEstadoPageViewState extends State<CandidatosPorEstadoPageView> {
  @override
  void initState() {
    super.initState();
    context.read<CandidatosPorEstadoChangeProvider>().fetchCandidatosPorEstado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 20,),
            _fifthSection(),
            SizedBox(height: 20,),
          ],
        )
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
          'Candidatos por Estado',
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

  AspectRatio _fifthSection() {
    final resultado = context.select((CandidatosPorEstadoChangeProvider h) => h.candidatosPorEstado);

    try {
      double.tryParse(resultado.elementAt(0).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    } catch (e) {
      return AspectRatio(
        aspectRatio: 1.0,
        child: Container(

        ),
      );
    }

    String? labelEstado_01 = resultado.elementAt(0).descricao;
    double  valorEstado_01 = double.tryParse(resultado.elementAt(0).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_02 = resultado.elementAt(1).descricao;
    double  valorEstado_02 = double.tryParse(resultado.elementAt(1).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_03 = resultado.elementAt(2).descricao;
    double  valorEstado_03 = double.tryParse(resultado.elementAt(2).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_04 = resultado.elementAt(3).descricao;
    double  valorEstado_04 = double.tryParse(resultado.elementAt(3).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_05 = resultado.elementAt(4).descricao;
    double  valorEstado_05 = double.tryParse(resultado.elementAt(4).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_06 = resultado.elementAt(5).descricao;
    double  valorEstado_06 = double.tryParse(resultado.elementAt(5).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_07 = resultado.elementAt(6).descricao;
    double  valorEstado_07 = double.tryParse(resultado.elementAt(6).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_08 = resultado.elementAt(7).descricao;
    double  valorEstado_08 = double.tryParse(resultado.elementAt(7).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_09 = resultado.elementAt(8).descricao;
    double  valorEstado_09 = double.tryParse(resultado.elementAt(8).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_10 = resultado.elementAt(9).descricao;
    double  valorEstado_10 = double.tryParse(resultado.elementAt(9).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_11 = resultado.elementAt(10).descricao;
    double  valorEstado_11 = double.tryParse(resultado.elementAt(10).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_12 = resultado.elementAt(11).descricao;
    double  valorEstado_12 = double.tryParse(resultado.elementAt(11).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_13 = resultado.elementAt(12).descricao;
    double  valorEstado_13 = double.tryParse(resultado.elementAt(12).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_14 = resultado.elementAt(13).descricao;
    double  valorEstado_14 = double.tryParse(resultado.elementAt(13).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_15 = resultado.elementAt(14).descricao;
    double  valorEstado_15 = double.tryParse(resultado.elementAt(14).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_16 = resultado.elementAt(15).descricao;
    double  valorEstado_16 = double.tryParse(resultado.elementAt(15).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_17 = resultado.elementAt(16).descricao;
    double  valorEstado_17 = double.tryParse(resultado.elementAt(16).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_18 = resultado.elementAt(17).descricao;
    double  valorEstado_18 = double.tryParse(resultado.elementAt(17).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_19 = resultado.elementAt(18).descricao;
    double  valorEstado_19 = double.tryParse(resultado.elementAt(18).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_20 = resultado.elementAt(19).descricao;
    double  valorEstado_20 = double.tryParse(resultado.elementAt(19).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_21 = resultado.elementAt(20).descricao;
    double  valorEstado_21 = double.tryParse(resultado.elementAt(20).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_22 = resultado.elementAt(21).descricao;
    double  valorEstado_22 = double.tryParse(resultado.elementAt(21).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_23 = resultado.elementAt(22).descricao;
    double  valorEstado_23 = double.tryParse(resultado.elementAt(22).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_24 = resultado.elementAt(23).descricao;
    double  valorEstado_24 = double.tryParse(resultado.elementAt(23).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_25 = resultado.elementAt(24).descricao;
    double  valorEstado_25 = double.tryParse(resultado.elementAt(24).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_26 = resultado.elementAt(25).descricao;
    double  valorEstado_26 = double.tryParse(resultado.elementAt(25).totalCandidatos.toString())?.truncateToDouble() ?? 0;
    String? labelEstado_27 = resultado.elementAt(26).descricao;
    double  valorEstado_27 = double.tryParse(resultado.elementAt(26).totalCandidatos.toString())?.truncateToDouble() ?? 0;

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
                        rotationQuarterTurns:1,
                        maxY: 27,
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
                              axisNameWidget: Text('Candidatos por estado'),
                              sideTitles: SideTitles(
                                  reservedSize: 60,
                                  showTitles: false,
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
                              getTitlesWidget: getTitlesCandidatosPorEstado,
                            ),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(toY: valorEstado_01, color: Color(0xFFFF0000))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(toY: valorEstado_02, color: Color(0xFF00FF00))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(toY: valorEstado_03, color: Color(0xFF0000FF))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(toY: valorEstado_04, color: Color(0xDDDDDD00))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(toY: valorEstado_05, color: Color(0xFFFF00FF))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(toY: valorEstado_06, color: Color(0xFF00FFFF))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(toY: valorEstado_07, color: Color(0xFF800000))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 7,
                            barRods: [
                              BarChartRodData(toY: valorEstado_08, color: Color(0xFF808000))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 8,
                            barRods: [
                              BarChartRodData(toY: valorEstado_09, color: Color(0xFF008000))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 9,
                            barRods: [
                              BarChartRodData(toY: valorEstado_10, color: Color(0xFF000080))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 10,
                            barRods: [
                              BarChartRodData(toY: valorEstado_11, color: Color(0xFF800080))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 11,
                            barRods: [
                              BarChartRodData(toY: valorEstado_12, color: Color(0xFF008080))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 12,
                            barRods: [
                              BarChartRodData(toY: valorEstado_13, color: Color(0xFFFFA500))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 13,
                            barRods: [
                              BarChartRodData(toY: valorEstado_14, color: Color(0xFF4B0082))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 14,
                            barRods: [
                              BarChartRodData(toY: valorEstado_15, color: Color(0xFFEE82EE))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 15,
                            barRods: [
                              BarChartRodData(toY: valorEstado_16, color: Color(0xFFDAA520))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 16,
                            barRods: [
                              BarChartRodData(toY: valorEstado_17, color: Color(0xFFC0C0C0))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 17,
                            barRods: [
                              BarChartRodData(toY: valorEstado_18, color: Color(0xFF4682B4))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 18,
                            barRods: [
                              BarChartRodData(toY: valorEstado_19, color: Color(0xFF2E8B57))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 19,
                            barRods: [
                              BarChartRodData(toY: valorEstado_20, color: Color(0xFFBA55D3))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 20,
                            barRods: [
                              BarChartRodData(toY: valorEstado_21, color: Color(0xFF7B68EE))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 21,
                            barRods: [
                              BarChartRodData(toY: valorEstado_22, color:  Color(0xFF32CD32))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 22,
                            barRods: [
                              BarChartRodData(toY: valorEstado_23, color:Color(0xFFFF4500))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 23,
                            barRods: [
                              BarChartRodData(toY: valorEstado_24, color: Color(0xFF8B4513))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 24,
                            barRods: [
                              BarChartRodData(toY: valorEstado_25, color: Color(0xFF20B2AA))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 25,
                            barRods: [
                              BarChartRodData(toY: valorEstado_26, color:Color(0xFFDC143C))
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 26,
                            barRods: [
                              BarChartRodData(toY: valorEstado_26, color:Color(0xFF9932CC))
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

  Widget getTitlesCandidatosPorEstado(double value, TitleMeta meta) {
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'AC';
        break;
      case 1:
        text = 'AL';
        break;
      case 2:
        text = 'AP';
        break;
      case 3:
        text = 'AM';
        break;
      case 4:
        text = 'BA';
        break;
      case 5:
        text = 'CE';
        break;
      case 6:
        text = 'DF';
        break;
      case 7:
        text = 'ES';
        break;
      case 8:
        text = 'GO';
        break;
      case 9:
        text = 'MA';
        break;
      case 10:
        text = 'MS';
        break;
      case 11:
        text = 'MT';
        break;
      case 12:
        text = 'MG';
        break;
      case 13:
        text = 'PR';
        break;
      case 14:
        text = 'PB';
        break;
      case 15:
        text = 'PA';
        break;
      case 16:
        text = 'PE';
        break;
      case 17:
        text = 'PI';
        break;
      case 18:
        text = 'RJ';
        break;
      case 19:
        text = 'RN';
        break;
      case 20:
        text = 'RS';
        break;
      case 21:
        text = 'RO';
        break;
      case 22:
        text = 'RR';
        break;
      case 23:
        text = 'SC';
        break;
      case 24:
        text = 'SE';
        break;
      case 25:
        text = 'SP';
        break;
      case 26:
        text = 'TO';
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