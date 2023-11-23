import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/widgets/Graphics/charts.dart';
import 'package:becertus_proyecto/widgets/Graphics/column_chart.dart';
import 'package:becertus_proyecto/widgets/Graphics/periodos/better_periods.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../functions/Provider.dart';
import '../models/courses.dart';

class MainPerformance extends StatefulWidget {
  const MainPerformance({super.key});

  @override
  State<MainPerformance> createState() => _MainPerformanceState();
}

class _MainPerformanceState extends State<MainPerformance> {
  String? selectedCourseKey;
  bool isLoading = true;
  bool hasLoadedData = false;
  final Map<String, Map<String, dynamic>> cursos = {
    'englishI': {
      'title': 'Inglés I',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.englishI ?? 0.0;
      }, // Puedes proporcionar valores iniciales si es necesario
      'color': const Color(0xFF08806F),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF08806F), Color(0xFF009E89)],
      ),
    },
    'proII': {
      'title': 'Proyecto II',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.proII ?? 0.0;
      },
      'color': const Color(0xFF00C1A7),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    'creaII': {
      'title': 'Creatividad',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.creaII ?? 0.0;
      },
      'color': const Color(0xFf00C1A7),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter, // Comenzar desde la parte superior
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    'ctI': {
      'title': 'Construcción y Tecnología',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.ctI ?? 0.0;
      },
      'color': const Color(0xFFC9D32B),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter, // Comenzar desde la parte superior
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFC9D32B),
          Color(0xFF97E138),
        ],
      ),
    },
    'thcaI': {
      'title': 'Teoría, historia y...',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.thcaI ?? 0.0;
      },
      'color': const Color(0xFFC9D32B),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter, // Comenzar desde la parte superior
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFC9D32B),
          Color(0xFF97E138),
        ],
      ),
    },
    'fisica': {
      'title': 'Física',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.fisica ?? 0.0;
      },
      'color': const Color(0xFFC9D32B),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter, // Comenzar desde la parte superior
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFC9D32B),
          Color(0xFF97E138),
        ],
      ),
    },
  };
 
 @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    setState(() {
      isLoading = true;
    });

   await Future.delayed(Duration(seconds: 1));

    // Después de cargar las notas, establece isLoading en false
    setState(() {
      isLoading = false;
      hasLoadedData = true;
    });
  }

  @override
  Widget build(BuildContext context) {

      final notasProvider = Provider.of<NotasProvider>(context);
      final ED = notasProvider.ED ?? 0.0;
      final FP = notasProvider.FP ?? 0.0;
      final EG = notasProvider.EG ?? 0.0;

      return Column(
        children: [
          Titles(
            text: 'Arquitectura',
            size: 24,
            fontFamily: 'Mitr',
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 3),
                    blurRadius: 3.5,
                  ),
                ],
                color: Color(0XFFF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    //height: 300,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: RadiusChartGen(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.46,
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            chipData2(
                              ED.toStringAsFixed(1),
                              0xffBBC700,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: InfoCourses(
                                    'Cursos enfocados en estrategias de Diseño Arquitectonico')),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            chipData2(
                              FP.toStringAsFixed(1),
                              0xff00C1A7,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                                child: InfoCourses(
                                    'Cursos de Formación Profesional')),
                          ],
                        ),
                        Row(
                          children: [
                            chipData2(
                              EG.toStringAsFixed(1),
                              0xff09806F,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(child: InfoCourses('Estudios Generales')),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
         Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.28,
              child: GenColumnChart(
                selectedCourseKey,
                cursos: cursos,
              )),
              
          SingleChildScrollView(
            
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var cursoData in allCursos['General'] ?? [])
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedCourseKey == cursoData['title']) {
                            selectedCourseKey = null;
                          } else {
                            selectedCourseKey = cursoData['title'];
                          }
                        });
                      },
                      
                      child: ChipContainer(
                        
                        titulo: cursoData['title'] ??
                            "Título no disponible", 
                            //Aca tambien primero se verifica si el valor viene nulo y si viene nulo le asignamos un valor 
                            //hasta que cargue la data

                          promedio: cursoData['average'] != null
                          ? (cursoData['average'](context)?.toStringAsFixed(1) ?? "N/A")
                          : "N/A",
                        gradient: cursoData['gradient'],
                        isSelected: selectedCourseKey == cursoData['title'],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //_betterScore(context),
                //  _worseScore(context)
              ],
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Titles(
              text: 'Rendimiento por periodos', size: 18, fontFamily: 'Mitr'),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: MyPeriodBar(),
          )
        ],
      );
    }
  }

/*
Row _betterScore(BuildContext context) {
  Map<String, dynamic> bestCourse = findHighestAverage(cursos, context);
  String bestAverage = bestCourse['average'].toStringAsFixed(
      1); // Inicializa con un valor muy alto para asegurarte de que cualquier promedio será menor.
  String bestCourseTitle = bestCourse['title'];

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.10,
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(1, 3),
                  blurRadius: 3.5,
                ),
              ],
              color: Color(0XFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Titles(text: 'Mejor Curso', size: 14, fontFamily: 'Arimo'),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width *
                            0.255, // Establece el ancho máximo del contenedor
                      ),
                      child: AutoSizeText(
                        bestCourseTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            height: 1,
                            fontFamily: 'Mitr',
                            fontSize: 18,
                            color: Color(0xff4B4B4B)),
                        minFontSize: 12, // Tamaño de fuente mínimo
                        maxFontSize: 20, // Tamaño de fuente máximo
                        presetFontSizes: [20, 16, 14, 12],
                      ),
                    ),

                    // Text('Promedio: $bestCourseAverage'),
                  ],
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFC9D32B),
                          Color.fromARGB(201, 100, 219, 112),
                        ],
                        stops: [0.0, 20],
                      )),
                  child: Center(
                    child: AutoSizeText(
                      bestAverage,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'Arimo',
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      minFontSize: 12, // Tamaño de fuente mínimo
                      maxFontSize: 20, // Tamaño de fuente máximo
                      presetFontSizes: [20, 16, 14, 12],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Row _worseScore(BuildContext context) {
  Map<String, dynamic> worstCourse = findWorstCourse(cursos);
  String worstAverage = worstCourse['average'].toStringAsFixed(
      1); // Inicializa con un valor muy alto para asegurarte de que cualquier promedio será menor.
  String worstCourseTitle = worstCourse['title'];
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.10,
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(1, 3),
                  blurRadius: 3.5,
                ),
              ],
              color: Color(0XFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Titles(text: 'Por Mejorar ', size: 14, fontFamily: 'Arimo'),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width *
                            0.26, // Establece el ancho máximo del contenedor
                      ),
                      child: AutoSizeText(
                        worstCourseTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            height: 1,
                            fontFamily: 'Mitr',
                            fontSize: 20,
                            color: Color(0xff4B4B4B)),
                        minFontSize: 12, // Tamaño de fuente mínimo
                        maxFontSize: 20, // Tamaño de fuente máximo
                        presetFontSizes: [20, 16, 14, 12],
                      ),
                    ),

                    // Text('Promedio: $bestCourseAverage'),
                  ],
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(colors: [
                        redStatic,
                        Color(0xFFEB078D),
                      ])),
                  child: Center(
                    child: Text(
                      worstAverage,
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Arimo',
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ],
  );
}*/

Text InfoCourses(String text2) {
  return Text(
    text2,
    style: TextStyle(
      fontSize: 11,
      height: 1,
      fontWeight: FontWeight.w400,
      fontFamily: 'Mitr',
      color: Color(0xFF323232),
    ),
    textAlign: TextAlign.start,
  );
}
