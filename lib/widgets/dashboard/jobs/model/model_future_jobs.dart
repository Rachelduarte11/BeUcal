import 'dart:math';
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
