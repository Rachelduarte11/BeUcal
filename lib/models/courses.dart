import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../functions/variables.dart';

Map<String, List<Map<String, dynamic>>> allCursos = {
  'ND1': [
    {
      'title': 'Inglés I',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd1EnglishI;
      },
      'color': const Color(0xFF08806F),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF08806F), Color(0xFF009E89)],
      ),
    },

    {
      'title': 'Construcción y Tecnología',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd1CtI;
      },
      'color': const Color(0xFF00C1A7),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Teoría, historia y...',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd1ThcaI;
      },
      'color': const Color(0xFF00C1A7),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Física',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd1Fisica;
      },
      'color': const Color(0xFF00C1A7),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Proyecto II',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd1ProII;
      },
      'color': const Color(0xFFC9D32B),
      'gradient': const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    },
    {
      'title': 'Creatividad',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd1CreaII;
      },
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    },
    // Otros cursos para ND1
  ],
  'ND2': [
    {
      'title': 'Inglés I',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd2EnglishI;
      },
      'color': Color(0xFF08806F),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF08806F), Color(0xFF009E89)],
      ),
    },

    {
      'title': 'Construcción y Tecnología',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd2CtI;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Teoría, historia y...',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd2ThcaI;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Física',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd2Fisica;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Proyecto II',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd2ProII;
      },
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    },
    {
      'title': 'Creatividad',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd2CreaII;
      },
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    },
    // Otros cursos para ND2
  ],
  'ND3': [
    {
      'title': 'Inglés I',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd3EnglishI;
      },
      'color': Color(0xFF08806F),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF08806F), Color(0xFF009E89)],
      ),
    },

    {
      'title': 'Construcción y Tecnología',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd3CtI;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Teoría, historia y...',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd3ThcaI;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Física',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd3Fisica;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Proyecto II',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd3ProII;
      },
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    },
    {
      'title': 'Creatividad',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.nd3CreaII;
      },
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    },
    // Otros cursos para ND3
  ],
  'General': [
    {
      'title': 'Inglés I',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.englishI;
      },
      'color': Color(0xFF08806F),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF08806F), Color(0xFF009E89)],
      ),
    },

    {
      'title': 'Construcción y Tecnología',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.ctI;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Teoría, historia y...',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.thcaI;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Física',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.fisica;
      },
      'color': Color(0xFF00C1A7),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF00C1A7), Color(0xFF39D7BA)],
      ),
    },
    {
      'title': 'Proyecto II',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.proII;
      },
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    },
    {
      'title': 'Creatividad',
      'average': (context) {
        final notasProvider =
            Provider.of<NotasProvider>(context, listen: false);
        return notasProvider.creaII;
      },
      'color': Color(0xFFC9D32B),
      'gradient': LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFC9D32B), Color(0xFF97E138)],
      ),
    }
    // Otros cursos para
  ],
};

// Llamar a la función para encontrar el mejor curso
// final bestCourseData = findBestCourse(performance);

Map<String, dynamic> findWorstCourse(
    Map<String, Map<String, dynamic>> courses) {
  double worstAverage = double
      .infinity; // Inicializa con un valor muy alto para asegurarte de que cualquier promedio será menor.
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

final Map<String, Map<String, dynamic>> cursos = {
  'englishI': {
    'title': 'Inglés I',
    'average': (context) {
      final notasProvider = Provider.of<NotasProvider>(context, listen: false);
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
      final notasProvider = Provider.of<NotasProvider>(context, listen: false);
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
      final notasProvider = Provider.of<NotasProvider>(context, listen: false);
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
      final notasProvider = Provider.of<NotasProvider>(context, listen: false);
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
      final notasProvider = Provider.of<NotasProvider>(context, listen: false);
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
      final notasProvider = Provider.of<NotasProvider>(context, listen: false);
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
 findHighestAverage(
    Map<String, Map<String, dynamic>> courses, BuildContext context) {
  double highestAverage = 0.0; // Inicializa el promedio más alto en 0
  String highestAverageCourseName = ''; // Inicializa el nombre del curso con el promedio más alto

  courses.forEach((courseKey, courseData) {
    final average = courseData['average'](context) as double;
    if (average > highestAverage) {
      highestAverage = average;
      highestAverageCourseName = courseData['title'] as String;
    }
  });

  print('El curso con el promedio más alto es: $highestAverageCourseName');
  print('El promedio más alto es: $highestAverage');
  
  return (highestAverageCourseName, highestAverage);
}
