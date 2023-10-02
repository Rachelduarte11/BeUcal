import 'package:flutter/material.dart';

class CustomeNavigationBar extends StatelessWidget {
  const CustomeNavigationBar({
    super.key,
  });
//barra de menu
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade600,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline),
          label: 'Play',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}