import 'package:becertus_proyecto/models/colors.dart';
import 'package:flutter/material.dart';

class CustomeNavigationBar extends StatelessWidget {
  const CustomeNavigationBar({
    super.key,
  });
//barra de menu
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0), // Radio en la esquina superior izquierda
        topRight: Radius.circular(24.0), // Radio en la esquina superior derecha
      ),
      child: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFE2E2E2),
        showUnselectedLabels: false,
        showSelectedLabels: false,
       // unselectedItemColor: greyDark,
        selectedItemColor: greyDark,
        items: [
          
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_rounded,
            size: 32, ),
            label: 'Stack',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded,
            size: 32,),
            activeIcon: const Icon(
              Icons.home_rounded,
              color: Color.fromARGB(255, 255, 153, 153),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined,
            size: 32,
            ),
            
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: CustomAddIcon(
              circleColor:
                  Color(0xFFFD6A6A), // Cambia el color del círculo exterior
              plusColor: Color.fromARGB(
                  255, 255, 255, 255), // Cambia el color del signo "+"
            ),
            label: 'Add',
          )
        ],
      ),
    );
  }
}

class CustomAddIcon extends StatelessWidget {
  final Color circleColor;
  final Color plusColor;

  CustomAddIcon({required this.circleColor, required this.plusColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: circleColor,
      radius: 18.0, // Tamaño del círculo exterior
      child: Center(
        child: Icon(
          Icons.add_rounded,
          color: plusColor, // Color del signo "+"
          size: 32.0, // Tamaño del signo "+"
        ),
      ),
    );
  }
}
