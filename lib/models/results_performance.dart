import 'package:flutter/material.dart';

import '../widgets/Graphics/charts.dart';


  Map<String, Map<String, dynamic>> performance = {
    'proII': {
      'title': 'Proyecto II',
      'average': proII,
      'color': Color(0xffFD6A6A),
    },
    'creaII': {
      'title': 'Creatividad',
      'average': creaII,
      'color': Color(0xffC9D32B),
    },
    'ctI': {
      'title': 'Construcción y Tecnología',
      'average': ctI,
      'color': Color(0xff00667C),
    },
    'thcaI': {
      'title': 'Teoría, historia y...',
      'average': thcaI,
      'color': Color(0xff44DECC),
    },
    'fisica': {
      'title': 'Física',
      'average': fisica,
      'color': Color(0xffF4A50B),
    },
    'englishI': {
      'title': 'Inglés I',
      'average': englishI,
      'color': Color(0xffEB078D),
    },
  };
  // Llamar a la función para encontrar el mejor curso
  final bestCourseData = findBestCourse(performance);



Map<String, dynamic> findBestCourse(Map<String, Map<String, dynamic>> courses) {
  double bestAverage = -1;
  String bestCourseTitle = '';

  courses.forEach((courseKey, courseData) {
    final average = courseData['average'] as double;
    if (average > bestAverage) {
      bestAverage = average;
      bestCourseTitle = courseData['title'] as String;
    }
  });

  return {
    'title': bestCourseTitle,
    'average': bestAverage,
  };
}

Map<String, dynamic> findWorstCourse(Map<String, Map<String, dynamic>> courses) {
  double worstAverage = double.infinity; // Inicializa con un valor muy alto para asegurarte de que cualquier promedio será menor.
  String worstCourseTitle = '';

  courses.forEach((courseKey, courseData) {
    final average = courseData['average'] as double;
    if (average < worstAverage) {
      worstAverage = average;
      worstCourseTitle = courseData['title'] as String;
    }
  });

  return {
    'title': worstCourseTitle,
    'average': worstAverage,
  };
}
