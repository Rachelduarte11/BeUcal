import 'package:becertus_proyecto/models/to_do_card.dart';
import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:becertus_proyecto/widgets/group_home.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  List<Widget> fragments = const [HomePage(), MyPerformance(), MyProfile()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        body:  CustomScrollView(
          slivers: [
            SliverAppBar(
               automaticallyImplyLeading: false,
              expandedHeight: 64,
              backgroundColor:
                  Colors.transparent, // Altura expandida del app bar
              floating:
                  true, // Configura en true para que el app bar sea flotante
              pinned:
                  false, // Configura en false para que el app bar no esté siempre visible
              flexibleSpace: CustomAppBar(),
            ),
            SliverToBoxAdapter(
              
              child: Column(
                children: [
                  GroupMain(),
                  GroupHabilitys(),
                  Text(
                    'Tareas Pendientes',
                    style: TextStyle(
                      color: Color(0xFF323232),
                      fontFamily: 'Mitr',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  _ToDoCard(),
                ],
              ),
              
            ),
          ],
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

class _ToDoCard extends StatelessWidget {
  const _ToDoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          ToDoCard(
            title: 'Wake up',
            check: true,
            time: '10am',
          ),
          SizedBox(
            height: 5,
          ),
          ToDoCard(
            title: 'Leer la guía',
            check: true,
            time: '10am',
          ),
          SizedBox(
            height: 5,
          ),
          ToDoCard(
            title: 'Wake up',
            check: false,
            time: '10am',
          ),
          SizedBox(
            height: 5,
          ),
          ToDoCard(
            title: 'Wake up',
            check: false,
            time: '10am',
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
