
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:becertus_proyecto/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Container(
   child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(),
        bottomNavigationBar:CustomeNavigationBar(),
   )
    );
  }
}
