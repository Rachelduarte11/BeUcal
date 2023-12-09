import 'package:becertus_proyecto/Students/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../functions/Provider.dart';
import '../jobs/model/courses.dart';
import '../widgets/Graphics/periodos/nd1.dart';
import '../widgets/Graphics/periodos/nd1_columns.dart';
import '../widgets/chip_data.dart';

class ND1Performance extends StatefulWidget {
  const ND1Performance({super.key});

  @override
  State<ND1Performance> createState() => _MainPerformanceState();
}

class _MainPerformanceState extends State<ND1Performance> {
  String? selectedCourseKey;

  final Map<String, Map<String, dynamic>> nd1cursos = {
    'englishI': {
      'title': 'Inglés I',
      'average': 0.0, // Puedes proporcionar valores iniciales si es necesario
      'color': Color(0xFF08806F),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF08806F), Color(0xFF009E89)],
      ),
    },
    'proII': {
      'title': 'Proyecto II',
      'average': 0.0,
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    'creaII': {
      'title': 'Creatividad',
      'average': 0.0,
      'color': Color(0xFf00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter, // Comenzar desde la parte superior
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    'ctI': {
      'title': 'Construcción y Tecnología',
      'average': 0.0,
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
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
      'average': 0.0,
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
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
      'average': 0.0,
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
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
  Widget build(BuildContext context) {
   
    final notasProvider = Provider.of<NotasProvider>(context);
    final nd1ED = notasProvider.nd1ED?? 0.0;
    final nd1FP = notasProvider.nd1FP?? 0.0; 
    final nd1EG = notasProvider.nd1EG?? 0.0;
    return Column(
      children: [
        Titles(
          text: 'Arquitectura',
          size: 24,
          fontFamily: 'Mitr',
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.20,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
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
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: ND1RadiusChartGen(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          chipData2(
                            nd1ED.toStringAsFixed(1),
                            0xffBBC700,
                          ),
                          SizedBox(
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
                            nd1FP.toStringAsFixed(1),
                            0xff00C1A7,
                          ),
                          SizedBox(
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
                            nd1EG.toStringAsFixed(1),
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
            child: ND1GenColumnChart(selectedCourseKey, nd1cursos: nd1cursos)),
       SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var cursoData in allCursos['ND1'] ?? [])
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
                          "Título no disponible", // Comprueba si el título es nulo
                      promedio: cursoData['average'](context).toStringAsFixed(
                          1), // Comprueba si el promedio es nulo
                      gradient: cursoData['gradient'],
                      isSelected: selectedCourseKey == cursoData['title'],
                    ),
                  ),
              ],
            ),
          ),
        ),
     ],
    );
  }

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
}
