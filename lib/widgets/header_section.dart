import 'package:becertus_proyecto/models/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Hola, Carlos', style: TextStyle(
        color: greyDark,
        fontFamily: 'Mitr',
        fontWeight: FontWeight.w600,
        fontSize: 36,
      ),),
      actions: [
        
        Container(
          
          child: const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/bf/6b/58/bf6b58acda530c62c5c2d5ae6daad222.jpg'),
          ),
        )
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
