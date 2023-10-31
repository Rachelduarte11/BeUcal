import 'package:flutter/material.dart';

import '../widgets/Graphics/charts.dart';

Map<String, Map<String, dynamic>> cursos = {
  'englishI': {
    'title': 'Inglés I',
    'average': englishIString,
    'color': Color(0xFF08806F),
    'gradient': LinearGradient(
      begin: Alignment.topCenter, // Comenzar desde la parte superior
  end: Alignment.bottomCenter,
      colors: [Color(0xFF08806F), Color(0xFF009E89)],
    ),
  },
  'proII': {
    'title': 'Proyecto II',
    'average': proIIString,
    'color': Color(0xFF00C1A7),
    'gradient': LinearGradient(
      begin: Alignment.topCenter, // Comenzar desde la parte superior
  end: Alignment.bottomCenter,
      colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
    ),
  },
  'creaII': {
    'title': 'Creatividad',
    'average': creaIIString,
    'color': Color(0xFf00C1A7),
    'gradient': LinearGradient(
      begin: Alignment.topCenter, // Comenzar desde la parte superior
  end: Alignment.bottomCenter,
      colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
    ),
  },
  'ctI': {
    'title': 'Construcción y Tecnología',
    'average': ctIString,
    'color':  Color(0xFFC9D32B),
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
    'average': thcaIString,
    'color':  Color(0xFFC9D32B),
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
    'average': fisicaString,
    'color':  Color(0xFFC9D32B),
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
/*
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
*/