import 'package:becertus_proyecto/models/to_do_card.dart';
import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
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
      decoration: const BoxDecoration(
        color: Color(0xffE8F8F6),
      ),
      child: Scaffold(
        backgroundColor: Color(0xffE8F8F6),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 64,
              backgroundColor:
                  Colors.transparent, // Altura expandida del app bar
              floating:
                  true, 
              pinned:
                  false, 
              flexibleSpace: CustomAppBar(),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  GroupMain(),
                  GroupHabilitys(),
                  Titles(
                    text: 'Tareas Pendientes',
                    size: 24,
                    fontFamily: 'Mitr',
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

// ignore: must_be_immutable
class Titles extends StatelessWidget {
  String text;
  String fontFamily;
  double size;
  Titles({
    required this.text,
    required this.size,
    required this.fontFamily,
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF323232),
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
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
          //  onDelete: (){},
          ),
          ToDoCard(
            titleTask: 'Investigar Historia',
            timeTask: '11/11/2023',
            check: true,
            chip: chipData('Teoría, Historia y...', 0xff44DECC),
           // onDelete: (){},
          ),
          ToDoCard(
            titleTask: 'Planear',
            timeTask: '30/10/2023',
            check: false,
            chip: chipData('Proyecto 1', 0xffFD6A6A),
           // onDelete: (){},
          ),
          ToDoCard(
            titleTask: 'Investigar Historia',
            timeTask: '11/11/2023',
            check: true,
            chip: chipData('Teoría, Historia y...', 0xff44DECC),
           //onDelete: (){},
          ),
          ToDoCard(
            titleTask: 'Planear',
            timeTask: '30/10/2023',
            check: false,
            chip: chipData('Proyecto 1', 0xffFD6A6A),
          //  onDelete: (){},
          ),
        ],
      ),
    );
  }
}
