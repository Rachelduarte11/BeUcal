import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/Students/jobs/jobs_screen.dart/analisis_datos.dart';
import 'package:becertus_proyecto/Students/jobs/widgets/Graphics/graphics_and_maps.dart';
import 'package:flutter/material.dart';

Map<String, List<Map<String, dynamic>>> allCompetencias = {
  'General': [
    {
      'title': 'Colaboración Auténtica',
      'average': '80%',
      'color': const Color(0xFF08806F),
    },
    {
      'title': 'Creatividad para alcanzar tus metas',
      'average': '60%',
      'color': const Color(0xFF00C1A7),
    },
    {
      'title': 'Adaptación al entorno',
      'average': '85%',
      'color': Color(0xFF44DECC),
    },
    {
      'title': 'Pensamiento crítico',
      'average': '90%',
      'color': const Color(0xFF9BFFF3),
    },
    {
      'title': 'Investigación',
      'average': '35%',
      'color': Color(0xFFC9D32B),
    },
  ],
  'Especificas': [
    {
      'title': 'Introducción a la Programación',
      'average': '38',
      'color': Color(0xFFF79521),
    },
    {
      'title': 'Química para Ingeníeria',
      'average': '78',
      'color': Color(0xFFF3B24F),
    },
  ]
};

//MAPA PARA COMPETENCIAS EN LAS SCREENS DE JOBS
Map<String, List<Map<String, dynamic>>> jobCompetencias = {
  'General': [
    {
      'title': 'Colaboración Auténtica',
      'average': '80%',
      'color': ColorConstants.color1,
    },
    {
      'title': 'Creatividad para alcanzar tus metas',
      'average': '60%',
      'color': ColorConstants.color2,
    },
    {
      'title': 'Adaptación al entorno',
      'average': '85%',
      'color': ColorConstants.color3,
    },
    {
      'title': 'Pensamiento crítico',
      'average': '90%',
      'color': ColorConstants.color4,
    },
    {
      'title': 'Investigación',
      'average': '35%',
      'color': ColorConstants.color5,
    },
  ],
  'Especificas': [
    {
      'title': 'Introducción a la Programación',
      'average': '38',
      'color': Color(0xFFF79521),
    },
    {
      'title': 'Química para Ingeníeria',
      'average': '78',
      'color': Color(0xFFF3B24F),
    },
  ]
};
class CircleAndText extends StatelessWidget {
  final String text;
  final Color color;

  CircleAndText(this.text, this.color);

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      width: MediaQuery.of(context).size.width * 0.42,
      child: Row(
        children: [
          CircleAvatar(
            radius: 6,
            backgroundColor: color,
          ),
          const SizedBox(width: 8),
          Container(
            width: MediaQuery.of(context).size.width * 0.36,
            child: AutoSizeText(
              text,
              minFontSize: 10.0, // Tamaño mínimo de fuente permitido
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color(0xff323232),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arimo'),
            ),
          ),
        ],
      ),
    );
  }
   static List<Widget> generateCircleAndTextWidgets() {
    List<Map<String, dynamic>>? generales = jobCompetencias['General'];
    if (generales == null) return [];

    return generales.map((item) {
       String text = item['title'] ?? 'Hola';
      Color color = item['color'] ?? Colors.transparent;
      return CircleAndText(text, color);
    }).toList();
  }
}
