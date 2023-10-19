import 'package:becertus_proyecto/models/to_do_card.dart';
import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:becertus_proyecto/widgets/group_home.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:becertus_proyecto/widgets/navigation_bar.dart';
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
        color: Color(0xffE8F8F6),
      ),
      child: Scaffold(
        backgroundColor: Color(0xffE8F8F6),
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
            titleTask: 'Wake up',
            timeTask: '11/11/2023',
            check: false,
            chip: chipData('Creatividad', 0xffC9D32B),
            
          ),
           ToDoCard(
            titleTask: 'Investigar Historia',
            timeTask: '11/11/2023',
            check: true,
            chip: chipData('Teoría, Historia y...', 0xff44DECC),
          ),
        ToDoCard(
            titleTask: 'Planear',
            timeTask: '30/10/2023',
            check: false,
            chip: chipData('Proyecto 1', 0xffFD6A6A),
          ),
        ],
      ),
    );
  }
}
