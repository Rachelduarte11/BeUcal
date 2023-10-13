import 'package:becertus_proyecto/screens/Started/loading.dart';
import 'package:becertus_proyecto/screens/Started/screen_1.dart';
import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
                bodyColor: Color.fromARGB(255, 230, 230, 230),
                displayColor: Colors.white,
              )),
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => const CustomAppBar()),
        // GetPage(name: '/song', page: ()=> const SongScreen()),
        // GetPage(name: '/', page: ()=> const PlaylistScreen()),
      ],
    );
  }
}
