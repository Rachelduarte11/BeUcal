
import 'package:becertus_proyecto/Students/dashboard/competencias_generales.dart/adaptacion.dart';
import 'package:becertus_proyecto/Students/dashboard/competencias_generales.dart/colaboracion_autentica.dart';
import 'package:becertus_proyecto/Students/dashboard/competencias_generales.dart/creatividad.dart';
import 'package:becertus_proyecto/Students/dashboard/competencias_generales.dart/investigacion.dart';
import 'package:becertus_proyecto/Students/dashboard/competencias_generales.dart/pensamiento.dart';
import 'package:becertus_proyecto/Students/dashboard/global/future_job.dart';
import 'package:becertus_proyecto/Students/dashboard/global/graphics/column_competencias.dart';
import 'package:becertus_proyecto/Students/dashboard/global/graphics/temperature.dart';
import 'package:becertus_proyecto/Students/jobs/jobs_screen.dart/analisis_datos.dart';
import 'package:becertus_proyecto/Students/jobs/jobs_screen.dart/analisis_inventario.dart';
import 'package:becertus_proyecto/Students/jobs/jobs_screen.dart/asistente.dart';
import 'package:becertus_proyecto/Students/jobs/jobs_screen.dart/rrhh.dart';
import 'package:becertus_proyecto/Students/jobs/model/competences_maps.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../jobs/widgets/Graphics/graphics_and_maps.dart';

class GroupHabilitys extends StatefulWidget {
  GroupHabilitys({super.key});

  @override
  State<GroupHabilitys> createState() => _GroupHabilitysState();
}

class _GroupHabilitysState extends State<GroupHabilitys> {
  int selectedND = 0 ;
  // 0: Global, 1:apoyo, 2:creatividad,
  Color colorApoyo = const Color(0xFFFD6A6A);
  Color colorCreatividad = const Color.fromARGB(206, 255, 255, 255);
  Color colorAdaptacion = const Color.fromARGB(206, 255, 255, 255);
  Color colorPensamientoCritico = const Color.fromARGB(206, 255, 255, 255);
  Color colorInvestigacion = const Color.fromARGB(206, 255, 255, 255);

  Color textColorApoyo = Colors.white;
  Color textColorCreatividad = Colors.black;
  Color textColorAdaptacion = Colors.black;
  Color textColorPensamientoCritico = Colors.black;
  Color textColorInvestigacion = Colors.black;

 final progressValue= jobList[0].progressValue?? 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          // padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          height: selectedND > 0
              ? MediaQuery.of(context).size.height * 1.1
              : MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  //padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: selectedND > 0
                            ? const AssetImage('assets/images/main2.png')
                            : const AssetImage('assets/images/main.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      const Text('Competencias',
                          style: TextStyle(
                              color: Color(0xff323232),
                              fontFamily: 'Mitr',
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _competencias(),
                          ],
                        ),
                      ),
                      selectedPerformanceWidget(),

                      //_contentCompetenciasGlobal(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: selectedND == 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.37,
            //padding: EdgeInsets.only(top: 6),
            // margin: EdgeInsets.only(bottom: 8),

            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'POSIBLES PUESTOS LABORALES',
                    style: TextStyle(
                      fontFamily: 'Arimo',
                      fontSize: 14,
                      color: Color.fromARGB(255, 31, 30, 30),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AverageFutureJob(
                        textFutureJob:
                            'Analista de Inventario y abastecimiento',
                        progressValue: jobList[0].progressValue?? 0,
                        pathImages:
                            'assets/images/jobs/analista-inventario.png',
                        pageJob: const AnalisisInventario(),
                        documentId: 'analista de datos',
                      ),
                      AverageFutureJob(
                        textFutureJob: 'Asistente de consultorías',
                        progressValue: jobList[1].progressValue?? 0,
                        pathImages: 'assets/images/jobs/asistente.png',
                        pageJob: const Asistente(),
                        documentId: 'analista de inventario',
                      ),
                      AverageFutureJob(
                          textFutureJob: 'Analista de datos',
                          progressValue: jobList[2].progressValue?? 0,
                          pathImages: 'assets/images/jobs/analista-datos.png',
                          pageJob: const AnalisisDatos(),
                          documentId: 'asistente de consultorias'),
                      AverageFutureJob(
                          textFutureJob: 'Especialista en RR.HH',
                          progressValue: jobList[3].progressValue?? 0,
                          pathImages: 'assets/images/jobs/rrhh.png',
                          pageJob: const RRHH(),
                          documentId: 'rrhh'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _contentCompetenciasGlobal(BuildContext context) {
    String temperature = obtenerEvaluacion(promedioPonderado);
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width ,
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassmorphicContainer(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.27,
                  borderRadius: 10,
                  blur: 20,
                  alignment: Alignment.topCenter,
                  border: 0.2,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
                      const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
                    ],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.26,
                    child: CompetenciasColumnChart())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassmorphicContainer(
                margin: const EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.18,
                borderRadius: 10,
                blur: 20,
                alignment: Alignment.center,
                border: 0.2,
                linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
                    const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
                  ],
                ),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.5),
                    const Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6, top: 4),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'GENERALES',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 212, 212, 212)),
                      ),
                    ),
                    competenciasList(colaboracionAutenticaColor,
                        colaboracionAutenticaTitle),
                    competenciasList(creatividadColor, creatividadTitle),
                    competenciasList(adaptacionColor, adaptacionTitle),
                    competenciasList(
                        pensamientoCriticoColor, pensamientoCriticoTitle),
                    competenciasList(investigacionColor, investigacionTitle),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GlassmorphicContainer(
                margin: const EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.18,
                borderRadius: 10,
                blur: 10,
                alignment: Alignment.center,
                border: 0.2,
                linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
                    const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
                  ],
                ),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.5),
                    const Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: const EdgeInsets.only(left: 6, top: 4),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'ESPECIFICAS',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 212, 212, 212)),
                      ),
                    ),
                    competenciasList(
                        introProgramacionColor, introProgramacionTitle),
                    competenciasList(
                        quimicaIngenieriaColor, quimicaIngenieriaTitle),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassmorphicContainer(
                  margin: const EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.28,
                  borderRadius: 10,
                  blur: 20,
                  alignment: Alignment.center,
                  border: 0.2,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
                      const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
                    ],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: const EdgeInsets.only(left: 6, top: 4),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'TERMÓMETRO DE RENDIMINETO',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 212, 212, 212)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        temperature,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Mitr',
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: Center(child: TuWidget())),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Container competenciasList(
      Color colorCompetencia, String variableCompetencia) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.03,
      child: Row(
        children: [
          const SizedBox(width: 4),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: colorCompetencia,
                borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              variableCompetencia,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Container _competencias() {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
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
              margin: const EdgeInsets.only(right: 4, left: 4),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(1, 1),
                      blurRadius: 3.5,
                    ),
                  ],
                  color: selectedND == 0
                      ? const Color(0xFF0BB49D)
                      : const Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                selectedND == 0
                    ? 'assets/images/iconos/global-light.png' // Imagen cuando está en rojo
                    : 'assets/images/iconos/global-dark.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 1;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 1
                    ? const Color(0xFF0BB49D)
                    : const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 1
                    ? 'assets/images/iconos/apoyo-light.png'
                    : 'assets/images/iconos/apoyo-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 2;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 2
                    ? const Color(0xFF0BB49D)
                    : const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 2
                    ? 'assets/images/iconos/bombilla-light.png'
                    : 'assets/images/iconos/bombilla-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 3;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 3
                    ? const Color(0xFF0BB49D)
                    : const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 3
                    ? 'assets/images/iconos/adaptacion-light.png'
                    : 'assets/images/iconos/adaptacion-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 4;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 4
                    ? const Color(0xFF0BB49D)
                    : const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 4
                    ? 'assets/images/iconos/pensamiento-light.png'
                    : 'assets/images/iconos/pensamiento-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 5;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(62, 26, 25, 25),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 5
                    ? const Color(0xFF0BB49D)
                    : const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 5
                    ? 'assets/images/iconos/investigacion-light.png'
                    : 'assets/images/iconos/investigacion-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 6;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 6
                    ? const Color(0xFF0BB49D)
                    : const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 6
                    ? 'assets/images/iconos/codificacion-light.png'
                    : 'assets/images/iconos/codificacion-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 7;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 7
                    ? const Color(0xFF0BB49D)
                    : const Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 7
                    ? 'assets/images/iconos/quimica-light.png'
                    : 'assets/images/iconos/quimica-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedPerformanceWidget() {
    switch (selectedND) {
      case 1:
        return const DashboardColaboracion();
      case 2:
        return const DashboardCreatividad();
      case 3:
        return const DashboardAdaptacion();
      case 4:
        return const DashboardPensamientoCritico();
      case 5:
        return const DashboardInvestigacion();
      case 6:
        return const DashboardInvestigacion();
      case 7:
        return const DashboardInvestigacion();
      default:
        return Visibility(
          visible: selectedND == 0,
          child: Column(
            children: [
              _contentCompetenciasGlobal(context),
            ],
          ),
        );
    }
  }
}

// Creacion de variables para cada competencia
String colaboracionAutenticaTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Colaboración Auténtica')['title'];
Color colaboracionAutenticaColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Colaboración Auténtica')['color'];

String creatividadTitle = allCompetencias['General']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Creatividad para alcanzar tus metas')['title'];
Color creatividadColor = allCompetencias['General']!.firstWhere((competencia) =>
    competencia['title'] == 'Creatividad para alcanzar tus metas')['color'];

String adaptacionTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Adaptación al entorno')['title'];
Color adaptacionColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Adaptación al entorno')['color'];

String pensamientoCriticoTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Pensamiento crítico')['title'];
Color pensamientoCriticoColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Pensamiento crítico')['color'];

String investigacionTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Investigación')['title'];
Color investigacionColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Investigación')['color'];

String introProgramacionTitle = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Introducción a la Programación')['title'];
Color introProgramacionColor = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Introducción a la Programación')['color'];

String quimicaIngenieriaTitle = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Química para Ingeníeria')['title'];
Color quimicaIngenieriaColor = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Química para Ingeníeria')['color'];
