import 'package:becertus_proyecto/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22, 0, 10, 0),
      margin: EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child:const  Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/bf/6b/58/bf6b58acda530c62c5c2d5ae6daad222.jpg',
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 6, 44, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Buenos Dias,',
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            height: 1,
                            color: Color(0xff313131),
                          ),
                        ),
                      ),
                      Text(
                        'Carlos',
                        style: TextStyle(
                          fontFamily: 'Mitr',
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          height: 1,
                          color: Color(0xff313131),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // Distribuir elementos en el espacio disponible
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: greyLight, // Color de fondo rojo
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                         child: badges.Badge(
                          badgeContent: Text('1'),
                          child: Center(
                            child: Icon(
                              Icons.email,
                              color: greyDark, // Color del icono blanco
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Espacio entre los iconos
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: greyLight, // Color de fondo rojo
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                       child: badges.Badge(
                          badgeContent: Text('3'),
                          child: Center(
                            child: Icon(
                              Icons.notifications,
                              color: greyDark, // Color del icono blanco
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
