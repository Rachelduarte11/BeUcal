import 'package:becertus_proyecto/Students/screens/calendar.dart';
import 'package:becertus_proyecto/Students/screens/home.dart';
import 'package:becertus_proyecto/Students/screens/performance_screen.dart';
import 'package:becertus_proyecto/Students/screens/profile.dart';
import 'package:becertus_proyecto/Students/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> fragments = const [
    HomePage(),
    MyPerformance(),
    Calendar(),
    MyProfile(),
  ];

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
