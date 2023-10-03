import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:becertus_proyecto/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(), // Pasa la instancia de User
      bottomNavigationBar: const CustomeNavigationBar(),
    );
  }
}