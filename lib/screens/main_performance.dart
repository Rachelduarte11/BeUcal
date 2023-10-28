import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/widgets/Graphics/charts.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
import 'package:flutter/material.dart';

import '../models/courses.dart';



class MainPerformance extends StatefulWidget {
  const MainPerformance({super.key});

  @override
  State<MainPerformance> createState() => _MainPerformanceState();
}

class _MainPerformanceState extends State<MainPerformance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Titles(text: 'Arquitectura'),
        SizedBox(
          height: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.22,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(1, 3),
                      blurRadius: 3.5,
                    ),
                  ],
              color: Color(0XFFE7E2E2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ClipRRect(
            
            child: Row(
             
             children: [
               Container(
    
                 width: MediaQuery.of(context).size.width * 0.46,
                 //height: 300,
                 decoration: BoxDecoration(
                   color: Colors.transparent,
                 ),
                 child: RadiusChartGen(),
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
                           '$ED',
                           0xff6851F3,
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
                           '$FP',
                           0xffEBCA73,
                         ),
                         SizedBox(
                           width: 4,
                         ),
                         Expanded(
                             child:
                                 InfoCourses('Cursos de Formación Profesional')),
                       ],
                     ),
                     Row(
                       children: [
                         chipData2(
                           '$EG',
                           0xffF56D6C,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              for (var cursoKey in cursos.keys)
              ChipContainer(
                titulo: cursos[cursoKey]?['title'],
                promedio: cursos[cursoKey]?['average'],
                color: cursos[cursoKey]?['color'],
              )
            ],),
          ),
        )
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
