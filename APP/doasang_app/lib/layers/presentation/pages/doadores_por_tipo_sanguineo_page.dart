import 'package:doasang_app/layers/domain/usecase/get_all_doadores_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/presentation/providers/doadores_por_tipo_sanguineo_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class DoadoresPorTipoSanguineoPage extends StatelessWidget {
  const DoadoresPorTipoSanguineoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCaseDoadoresPorTipoSanguineo = context.read<GetAllDoadoresPorTipoSanguineo>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DoadoresPorTipoSanguineoChangeProvider(getAllDoadoresPorTipoSanguineo: useCaseDoadoresPorTipoSanguineo),
        ),
      ],
      child: const DoadoresPorTipoSanguineoPageView(),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class DoadoresPorTipoSanguineoPageView extends StatefulWidget {
  const DoadoresPorTipoSanguineoPageView({super.key});

  @override
  State<DoadoresPorTipoSanguineoPageView> createState() => _DoadoresPorTipoSanguineoPageViewState();
}

class _DoadoresPorTipoSanguineoPageViewState extends State<DoadoresPorTipoSanguineoPageView> {
  @override
  void initState() {
    super.initState();
    context.read<DoadoresPorTipoSanguineoChangeProvider>().fetchDoadoresPorTipoSanguineo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 20,),
            _fourthSection(),
            SizedBox(height: 30,),
          ],
        )
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
          'Doadores por Tipo Sanguíneo',
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

  AspectRatio _fourthSection() {
    final resultado = context.select((DoadoresPorTipoSanguineoChangeProvider h) => h.doadoresPorTipoSanguineo);

    try {
      double.tryParse(resultado.elementAt(0).totalDoadores.toString())?.truncateToDouble() ?? 0;
    } catch (e) {
      return AspectRatio(
        aspectRatio: 1.0,
        child: Container(

        ),
      );
    }

    String? labelTipoSangueDoador_01 = resultado.elementAt(0).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_01 = resultado.elementAt(0).tipoSanguineoReceptor;
    double  totalDoadores_01 = double.tryParse(resultado.elementAt(0).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_02 = resultado.elementAt(1).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_02 = resultado.elementAt(1).tipoSanguineoReceptor;
    double  totalDoadores_02 = double.tryParse(resultado.elementAt(1).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_03 = resultado.elementAt(2).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_03 = resultado.elementAt(2).tipoSanguineoReceptor;
    double  totalDoadores_03 = double.tryParse(resultado.elementAt(2).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_04 = resultado.elementAt(3).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_04 = resultado.elementAt(3).tipoSanguineoReceptor;
    double  totalDoadores_04 = double.tryParse(resultado.elementAt(3).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_05 = resultado.elementAt(4).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_05 = resultado.elementAt(4).tipoSanguineoReceptor;
    double  totalDoadores_05 = double.tryParse(resultado.elementAt(4).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_06 = resultado.elementAt(5).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_06 = resultado.elementAt(5).tipoSanguineoReceptor;
    double  totalDoadores_06 = double.tryParse(resultado.elementAt(5).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_07 = resultado.elementAt(6).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_07 = resultado.elementAt(6).tipoSanguineoReceptor;
    double  totalDoadores_07 = double.tryParse(resultado.elementAt(6).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_08 = resultado.elementAt(7).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_08 = resultado.elementAt(7).tipoSanguineoReceptor;
    double  totalDoadores_08 = double.tryParse(resultado.elementAt(7).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_09 = resultado.elementAt(8).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_09 = resultado.elementAt(8).tipoSanguineoReceptor;
    double  totalDoadores_09 = double.tryParse(resultado.elementAt(8).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_10 = resultado.elementAt(9).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_10 = resultado.elementAt(9).tipoSanguineoReceptor;
    double  totalDoadores_10 = double.tryParse(resultado.elementAt(9).totalDoadores.toString())?.truncateToDouble() ?? 0;

    String? labelTipoSangueDoador_11 = resultado.elementAt(10).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_11 = resultado.elementAt(10).tipoSanguineoReceptor;
    double  totalDoadores_11 = double.tryParse(resultado.elementAt(10).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_12 = resultado.elementAt(11).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_12 = resultado.elementAt(11).tipoSanguineoReceptor;
    double  totalDoadores_12 = double.tryParse(resultado.elementAt(11).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_13 = resultado.elementAt(12).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_13 = resultado.elementAt(12).tipoSanguineoReceptor;
    double  totalDoadores_13 = double.tryParse(resultado.elementAt(12).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_14 = resultado.elementAt(13).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_14 = resultado.elementAt(13).tipoSanguineoReceptor;
    double  totalDoadores_14 = double.tryParse(resultado.elementAt(13).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_15 = resultado.elementAt(14).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_15 = resultado.elementAt(14).tipoSanguineoReceptor;
    double  totalDoadores_15 = double.tryParse(resultado.elementAt(14).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_16 = resultado.elementAt(15).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_16 = resultado.elementAt(15).tipoSanguineoReceptor;
    double  totalDoadores_16 = double.tryParse(resultado.elementAt(15).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_17 = resultado.elementAt(16).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_17 = resultado.elementAt(16).tipoSanguineoReceptor;
    double  totalDoadores_17 = double.tryParse(resultado.elementAt(16).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_18 = resultado.elementAt(17).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_18 = resultado.elementAt(17).tipoSanguineoReceptor;
    double  totalDoadores_18 = double.tryParse(resultado.elementAt(17).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_19 = resultado.elementAt(18).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_19 = resultado.elementAt(18).tipoSanguineoReceptor;
    double  totalDoadores_19 = double.tryParse(resultado.elementAt(18).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_20 = resultado.elementAt(19).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_20 = resultado.elementAt(19).tipoSanguineoReceptor;
    double  totalDoadores_20 = double.tryParse(resultado.elementAt(19).totalDoadores.toString())?.truncateToDouble() ?? 0;
    String? labelTipoSangueDoador_21 = resultado.elementAt(20).tipoSanguineoDoador;
    String? labelTipoSangueReceptor_21 = resultado.elementAt(20).tipoSanguineoReceptor;
    double  totalDoadores_21 = double.tryParse(resultado.elementAt(20).totalDoadores.toString())?.truncateToDouble() ?? 0;

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
                      maxY: 230,
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
                            axisNameWidget: Text('Doadores / Tipo Sanguíneo Receptor'),
                            sideTitles: SideTitles(
                                reservedSize: 50,
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
                            getTitlesWidget: getTitlesReceptoresTiposSanguineos,
                          ),
                        ),
                      ),
                      barGroups: [

                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_01, Color.fromRGBO(255, 200, 200, 1)),
                              BarChartRodStackItem(totalDoadores_01, totalDoadores_01 + totalDoadores_02, Colors.red),
                              BarChartRodStackItem(totalDoadores_01 + totalDoadores_02, totalDoadores_01 + totalDoadores_02 + totalDoadores_03, Colors.green),
                              BarChartRodStackItem(totalDoadores_01 + totalDoadores_02 + totalDoadores_03, totalDoadores_01 + totalDoadores_02 + totalDoadores_03 + totalDoadores_04 , Colors.orange)
                            ],
                            toY: totalDoadores_01 + totalDoadores_02 + totalDoadores_03 + totalDoadores_04, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),

                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_05, Color.fromRGBO(255, 200, 200, 1)),
                              BarChartRodStackItem(totalDoadores_05, totalDoadores_05 + totalDoadores_06, Colors.green),
                            ],
                            toY: totalDoadores_05 + totalDoadores_06, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),

                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_06, Color.fromRGBO(170, 255, 170, 1)),
                              BarChartRodStackItem(totalDoadores_06, totalDoadores_06 + totalDoadores_07, Colors.green),
                              BarChartRodStackItem(totalDoadores_06 + totalDoadores_07, totalDoadores_06 + totalDoadores_07 + totalDoadores_08, Color.fromRGBO(255, 185, 115, 1)),
                              BarChartRodStackItem(totalDoadores_06 + totalDoadores_07 + totalDoadores_08, totalDoadores_06 + totalDoadores_07 + totalDoadores_08 + totalDoadores_09 , Colors.orange)
                            ],
                            toY: totalDoadores_06 + totalDoadores_07 + totalDoadores_08 + totalDoadores_09, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),


                        BarChartGroupData(x: 3, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_09, Color.fromRGBO(170, 255, 170, 1)),
                              BarChartRodStackItem(totalDoadores_09, totalDoadores_09 + totalDoadores_10, Colors.green),
                            ],
                            toY: totalDoadores_09 + totalDoadores_10, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),

                        BarChartGroupData(x: 4, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_10, Color.fromRGBO(170, 255, 170, 1)),
                              BarChartRodStackItem(totalDoadores_10, totalDoadores_10 + totalDoadores_11, Colors.green),
                              BarChartRodStackItem(totalDoadores_10 + totalDoadores_11, totalDoadores_10 + totalDoadores_11 + totalDoadores_12, Colors.amber),
                              BarChartRodStackItem(totalDoadores_10 + totalDoadores_11 + totalDoadores_12, totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13, Colors.red),
                              BarChartRodStackItem(totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13, totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14, Colors.blue),
                              BarChartRodStackItem(totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14, totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14 + totalDoadores_15, Colors.purpleAccent),
                              BarChartRodStackItem(totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14 + totalDoadores_15, totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14 + totalDoadores_15 + totalDoadores_16, Colors.pinkAccent),
                              BarChartRodStackItem(totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14 + totalDoadores_15 + totalDoadores_16, totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14 + totalDoadores_15 + totalDoadores_16 + totalDoadores_17, Colors.black26),

                            ],
                            toY: totalDoadores_10 + totalDoadores_11 + totalDoadores_12 + totalDoadores_13 + totalDoadores_14 + totalDoadores_15 + totalDoadores_16 + totalDoadores_17, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),

                        BarChartGroupData(x: 5, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_17, Colors.red),
                              BarChartRodStackItem(totalDoadores_17, totalDoadores_17 + totalDoadores_18, Colors.amber),
                              BarChartRodStackItem(totalDoadores_17 + totalDoadores_18, totalDoadores_17 + totalDoadores_18 + totalDoadores_19, Colors.green),
                              BarChartRodStackItem(totalDoadores_17 + totalDoadores_18 + totalDoadores_19, totalDoadores_17 + totalDoadores_18 + totalDoadores_19 + totalDoadores_20, Color.fromRGBO(170, 255, 170, 1)),

                            ],
                            toY: totalDoadores_17 + totalDoadores_18 + totalDoadores_19 + totalDoadores_20, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),


                        BarChartGroupData(x: 6, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_20, Colors.red),
                              BarChartRodStackItem(totalDoadores_20, totalDoadores_20 + totalDoadores_21, Colors.amber),

                            ],
                            toY: totalDoadores_20 + totalDoadores_21, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),

                        BarChartGroupData(x: 7, barRods: [
                          BarChartRodData(
                            rodStackItems: [
                              BarChartRodStackItem(0, totalDoadores_21, Colors.red),

                            ],
                            toY: totalDoadores_21, // total do tipo sanguíneo.
                            color: Colors.transparent,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ]),


                      ],
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitlesReceptoresTiposSanguineos (double value, TitleMeta meta) {
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