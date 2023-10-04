import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:becertus_proyecto/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xfffafafa),

        ),
        child: const Scaffold(
          backgroundColor: Color.fromARGB(255, 246, 246, 246),
          appBar: CustomAppBar(),
          bottomNavigationBar: CustomeNavigationBar(),
          
        )
        );
  }
}
