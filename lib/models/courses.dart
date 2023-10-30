import 'package:flutter/material.dart';

import '../widgets/Graphics/charts.dart';

Map<String, Map<String, dynamic>> cursos = {
  'englishI': {
    'title': 'Inglés I',
    'average': englishIString,
    'color': Color(0xffC9D32B),
  },
  'proII': {
    'title': 'Proyecto II',
    'average': proIIString,
    'color': Color(0xffF79521),
  },
  'creaII': {
    'title': 'Creatividad',
    'average': creaIIString,
    'color': Color(0xffF79521),
  },
  'ctI': {
    'title': 'Construcción y Tecnología',
    'average': ctIString,
    'color': Color(0xff0DC2AA),
  },
  'thcaI': {
    'title': 'Teoría, historia y...',
    'average': thcaIString,
    'color': Color(0xff0DC2AA),
  },
  'fisica': {
    'title': 'Física',
    'average': fisicaString,
    'color': Color(0xff0DC2AA),
  },
};

Map<String, Map<String, dynamic>> periodosUniversidad = {
  'ND1': {
    'title': 'Periodo ND1',
    'average': nd1EG, // Reemplaza con el valor correcto del promedio para "ND1"
  },
  'ND2': {
    'title': 'Periodo ND2',
    'average': nd2EG, // Reemplaza con el valor correcto del promedio para "ND2"
  },
  'ND3': {
    'title': 'Periodo ND3',
    'average': nd3EG, // Reemplaza con el valor correcto del promedio para "ND3"
  },
};