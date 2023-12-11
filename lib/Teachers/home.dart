
import 'package:becertus_proyecto/Teachers/screens/calendar_teacher.dart';
import 'package:becertus_proyecto/Teachers/screens/home_teacher.dart';
import 'package:becertus_proyecto/Teachers/screens/performance_gestion.dart';
import 'package:becertus_proyecto/Teachers/screens/profile.dart';
import 'package:flutter/material.dart';

import '../Students/widgets/navigation_bar.dart';

class HomeScreenTeacher extends StatefulWidget {
  const HomeScreenTeacher({super.key});

  @override
  State<HomeScreenTeacher> createState() => _HomeScreenTeacherState();
}

class _HomeScreenTeacherState extends State<HomeScreenTeacher> {
  
  List<Widget> fragments =  [HomeTeacherScreen(), PerformanceTeacher(), CalendarTeacher(), ProfileTeacher(),];
 

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        bottomNavigationBar: CustomeNavigationBar(onTab),
        // Usar AnimatedSwitcher para la transición de desvanecimiento
        body: AnimatedSwitcher(
          duration: Duration(
              milliseconds: 400), // Duración de la animación de desvanecimiento
          child: fragments[currentIndex],
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    );
  }

  onTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}