import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:becertus_proyecto/Students/screens/calendar.dart';
import 'package:becertus_proyecto/Students/screens/home.dart';
import 'package:becertus_proyecto/Students/screens/performance_screen.dart';
import 'package:becertus_proyecto/Students/screens/profile.dart';
import 'package:becertus_proyecto/Students/dashboard/global/range_jobs.dart';
import 'package:becertus_proyecto/Students/jobs/widgets/Graphics/counter_way.dart';
import 'package:becertus_proyecto/Students/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class Asistente extends StatefulWidget {
  const Asistente({super.key});

  @override
  State<Asistente> createState() => _AsistenteState();
}

class _AsistenteState extends State<Asistente> {
  bool contenedorVisible1 = true;
  bool contenedorVisible2 = true;
  final List<Widget> screens = [
    const HomePage(),
    const MyPerformance(),
    const Calendar(),
    const MyProfile(),
  ];

  int currentIndex = 5;

  void onTab(int index) {
    if (index == 0) {
      Navigator.of(context).pop(); // Regresar a HomePage
    } else {
      setState(() {
        currentIndex = index; // Ajustar índice para la nueva lista
      });
    }
  }

  int selectedND = 0; // 0: Todos, 1: ND1, 2: ND2, 3: ND3

  Color colorND1 = const Color(0xFFFD6A6A);
  Color colorND2 = const Color(0XFFE7E2E2);
  Color textColorND1 = Colors.white;
  Color textColorND2 = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F8F7),
      // drawer: MyDrawer(),
      bottomNavigationBar: CustomeNavigationBar(onTab),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {
              // Acción al presionar el botón de retroceso
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Analista de Datos',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff12B19C),
          elevation: 0,
          expandedHeight: 40, // Altura expandida de la SliverAppBar
          floating:
              true, // La AppBar no se desvanece cuando se hace scroll hacia abajo
          pinned:
              true, // La AppBar permanece fija cuando se hace scroll hacia arriba
        ),
        SliverToBoxAdapter(
          child: Container(
            // Tu contenido aquí
            height: MediaQuery.of(context).size.height*1.1 ,
            color: Color(0xFFE8F8F7),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                //alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: selectedND==1 ? MediaQuery.of(context).size.height * 1.5:
                MediaQuery.of(context).size.height*1.1 ,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff12B19C),
                      Color.fromARGB(255, 127, 205, 247).withOpacity(0.6),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: Text(
                          'Competencias para este puesto laboral',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'Arimo',
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      DonutChartGen(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedND = 0;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: greyLight, width: 0.5),
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedND == 0
                                        ? Color.fromARGB(238, 238, 238, 238)
                                        : Colors.transparent),
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                child: Text('Todos',
                                    style: TextStyle(
                                        color: selectedND == 0
                                            ? Color(0xff0BB49D)
                                            : Color(0XFFE7E2E2))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedND = 1;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: greyLight, width: 0.5),
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedND == 1
                                        ? Color.fromARGB(238, 238, 238, 238)
                                        : Colors.transparent),
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                child: Text('Detalles',
                                    style: TextStyle(
                                        color: selectedND == 1
                                            ? Color(0xff0BB49D)
                                            : Color(0XFFE7E2E2))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (selectedND == 1) DetailsButton(),
                      Visibility(
                        visible: selectedND != 1,
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.6,
                          decoration: BoxDecoration(
                              color: Color(0xffE8F8F6),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _leyendaAbilitys(context),
                                const MovingAvatar(),
                                
                                noDevelopmentAbilitys(context)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      //  ),
    );
  }

  Center noDevelopmentAbilitys(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: const Color(0XFFF5F5F5),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(62, 133, 132, 132),
                offset: Offset(1, 1),
                blurRadius: 3.5,
              ),
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Column(children: [
          Text(
            'Competencias que faltan desarrollar',
            style: TextStyle(
                color: Color(0xff323232),
                fontFamily: 'Arimo',
                fontWeight: FontWeight.w500),
          ),
          competenciasDesarrollar(
            context,
            'Para mejorar esta competencia, te hace falta avanzar en Enfoque Teórico y Análisis de Datos',
            10,
            ColorConstants.color1,
            'Investigacion',
            contenedorVisible1,
            () {
              setState(() {
                contenedorVisible1 = !contenedorVisible1;
              });
            },
          ),
          competenciasDesarrollar(
            context,
            'Para desarrollar esta competencia te hace falta mejorar la Comunicación efectiva',
            10,
            ColorConstants.color2,
            'Colaboración Autentica',
            contenedorVisible2,
            () {
              setState(() {
                contenedorVisible2 = !contenedorVisible2;
              });
            },
          )
        ]),
      ),
    );
  }

  Container _leyendaAbilitys(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.09,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(62, 133, 132, 132),
              offset: Offset(1, 1),
              blurRadius: 3.5,
            ),
          ],
          color: Color(0XFFF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: ClipRRect(
          child: Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Wrap(
              spacing: 4.0, // Espaciado horizontal entre los elementos
              runSpacing: 4.0,
              children: [
                CircleAndText('Texto 1', ColorConstants.color1),
                CircleAndText('Texto 1', ColorConstants.color2),
                CircleAndText('Texto 1', ColorConstants.color3),
                CircleAndText('Texto 1', ColorConstants.color4),
                CircleAndText('Texto 1', ColorConstants.color5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget competenciasDesarrollar(
    BuildContext context,
    String capacidadesText,
    double value,
    Color color1,
    String competencia,
    bool isVisible,
    VoidCallback onPressed,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: greyLight, style: BorderStyle.solid)),
      child: Row(children: [
        Visibility(
          visible: isVisible,
          child: Row(
            children: [
              ProgressBarRange(value, color1, color1),
              SizedBox(width: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'COMPETENCIA',
                      style: TextStyle(color: Color(0xff323232), fontSize: 10),
                    ),
                    AutoSizeText(
                      competencia,
                      style: const TextStyle(
                          fontFamily: 'Mitr',
                          color: Color(0xff323232),
                          fontSize: 18,
                          height: 1),
                      maxLines: 2,
                      minFontSize: 12.0, // Tamaño mínimo de la fuente
                      maxFontSize: 24.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: !isVisible,
          child: Row(
            children: [
              ProgressBarRange(value, color1, color1),
              SizedBox(width: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CAPACIDADES',
                      style: TextStyle(color: Color(0xff323232), fontSize: 10),
                    ),
                    AutoSizeText(
                      capacidadesText,
                      style: TextStyle(
                          fontFamily: 'Arimo',
                          color: Color(0xff323232),
                          fontSize: 12,
                          height: 1),
                      maxLines: 4,
                      minFontSize: 10.0, // Tamaño mínimo de la fuente
                      maxFontSize: 18.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // SizedBox(width: 5,),
        arrowContainerVisible(isVisible, onPressed),
      ]),
    );
  }

  IconButton arrowContainerVisible(bool isVisible, VoidCallback onPressed) {
    return IconButton(
        icon: Icon(
          isVisible
              ? Icons.arrow_forward_ios_outlined
              : Icons.arrow_back_ios_outlined,
          size: 18,
          color: Color(0xff323232),
        ),
        onPressed: onPressed);
  }
}

class CircleAndText extends StatelessWidget {
  final String text;
  final Color color;

  CircleAndText(this.text, this.color);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width * 0.40,
      child: Row(
        children: [
          CircleAvatar(
            radius: 6,
            backgroundColor: color,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
                color: Color(0xff323232),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arimo'),
          ),
        ],
      ),
    );
  }
}

class DonutChartGen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value1 = 19.0;
    final value2 = 10.0;
    final value3 = 20.0;
    final value4 = 10.0;
    final value5 = 20.0;

    final _chartData = getChartData(value1, value2, value3, value4, value5);
    final averageData = value1 + value2 + value3 + value4 + value5;
    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<GDPData, dynamic>(
          dataSource: _chartData,
          innerRadius: '50%',
          explode: true,
          explodeOffset: '10%',
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              textStyle: TextStyle(color: Colors.white, fontSize: 16)),
          xValueMapper: (GDPData data, _) => data.course,
          yValueMapper: (GDPData data, _) => data.value,
          pointColorMapper: (GDPData data, _) => data.color,
        ),
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Center(
            child: Text(
              averageData.toStringAsFixed(0) + '%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<GDPData> getChartData(double value1, double value2, double value3,
      double value4, double value5) {
    return [
      GDPData('Category 1', value1, ColorConstants.color1),
      GDPData('Category 2', value2, ColorConstants.color2),
      GDPData('Category 3', value3, ColorConstants.color3),
      GDPData('Category 4', value4, ColorConstants.color4),
      GDPData('Category 5', value5, ColorConstants.color5),
    ];
  }
}

class ColorConstants {
  static const Color color1 = Color(0xffBBC700);
  static const Color color2 = Color.fromARGB(255, 106, 193, 0);
  static const Color color3 = Color(0xff09806F);
  static const Color color4 = Color(0xffFF6B6B);
  static const Color color5 = Color.fromARGB(225, 248, 178, 37);
}

class GDPData {
  GDPData(this.course, this.value, this.color);
  final String course;
  final double value;
  final Color color;
}

class DetailsButton extends StatelessWidget {
  const DetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    NotasProvider notasProvider = Provider.of<NotasProvider>(context);
    String? photoUrlJob = notasProvider.photoUrlJob;
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height ,
      decoration: const BoxDecoration(
          color: Color(0xffE8F8F6),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child:  Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width *0.9,
            height: MediaQuery.of(context).size.height *0.2,
            margin: EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
              child: Image.network(photoUrlJob??''),
         
          ),
          Center(
          
            child: Text(
              '''Un analista de datos es un profesional especializado en interpretar y analizar conjuntos de datos para extraer información valiosa y respaldar la toma de decisiones. Utiliza herramientas y técnicas estadísticas, así como habilidades en programación y visualización de datos, para identificar patrones, tendencias y conocimientos clave.Los analistas de datos trabajan en diversos sectores, desde negocios y finanzas hasta salud y tecnología, colaborando con equipos para resolver problemas específicos, mejorar procesos y optimizar estrategias empresariales.''',
              style: TextStyle(fontSize: 12, color: Color(0xff323232),),
            ),
          ),
          SizedBox(height: 5,),
          Text(
              'Responsabilidades Típicas',
              style: TextStyle(fontSize: 16, color: Color(0xff323232),  fontFamily: 'Mitr'),
            ),
          Text(
  '''
  Recopilación de Datos
  Análisis Estadístico
  Modelado de Datos
  Visualización de Datos
  Informes y Presentaciones
  Colaboración
  ''',style: TextStyle(fontSize: 14, color: Color(0xff323232), fontFamily: 'Arimo'),
          ),
          SizedBox(height: 5,),
          Text(
              'Tendencias de Carrera',
              style: TextStyle(fontSize: 16, color: Color(0xff323232), fontFamily: 'Mitr'),
            ),
          Center(
            child: Text(
              '''Con la creciente importancia de los datos en el mundo empresarial, la demanda de analistas de datos está en aumento. Se espera que la profesión continúe siendo clave en la toma de decisiones estratégicas y el desarrollo de soluciones innovadoras en diversas industrias. La capacitación continua en nuevas tecnologías y técnicas de análisis de datos es esencial para mantenerse relevante en este campo en constante evolución.''',
              style: TextStyle(fontSize: 12, color: Color(0xff323232)),
            ),
          )
        ],
      ),
    );
  }
}
