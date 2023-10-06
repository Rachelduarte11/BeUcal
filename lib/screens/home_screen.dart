import 'package:becertus_proyecto/models/to_do_card.dart';
import 'package:becertus_proyecto/widgets/group_home.dart';
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
          backgroundColor: Color.fromARGB(255, 244, 244, 244),
          appBar: CustomAppBar(),
          bottomNavigationBar: CustomeNavigationBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
               GroupMain(),
                GroupHabilitys(),
                Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ToDoCard(
                      title: 'Wake up',
                      check: true,
                      iconBgColor: Colors.white,
                      iconColor: Colors.red,
                      iconData: Icons.alarm,
                      time: '10am',
                    ),
                    SizedBox(height: 5,),
                    ToDoCard(
                      title: 'Leer la guía',
                      check: true,
                      iconBgColor: Colors.white,
                      iconColor: Colors.red,
                      iconData: Icons.book_rounded,
                      time: '10am',
                    ),
                    SizedBox(height: 5,),
                    ToDoCard(
                      title: 'Wake up',
                      check: false,
                      iconBgColor: Colors.white,
                      iconColor: Colors.red,
                      iconData: Icons.alarm,
                      time: '10am',
                    ),
                    SizedBox(height: 5,),
                    ToDoCard(
                      title: 'Wake up',
                      check: false,
                      iconBgColor: Color.fromARGB(255, 133, 44, 44),
                      iconColor: Colors.red,
                      iconData: Icons.alarm,
                      time: '10am',
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
                
                ),
              ]
            ),
          ) 
          ),
        
        );
  }
}
