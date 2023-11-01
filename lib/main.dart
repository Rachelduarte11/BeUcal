import 'package:becertus_proyecto/screens/Started/loading.dart';
import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:becertus_proyecto/screens/login_screen.dart';
import 'package:becertus_proyecto/screens/main_performance.dart';
import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';


Future<void> main() async {
   await initializeDateFormatting('es', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Flutter demo',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color.fromARGB(255, 230, 230, 230),
                displayColor: Colors.white,
              )),
      home: HomeScreen(),
      
    );
  }
}
