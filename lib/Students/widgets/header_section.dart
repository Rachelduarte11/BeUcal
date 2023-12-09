import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:becertus_proyecto/Students/screens/notification.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String email_input = '';
    String password_input = '';
    NotasProvider notasProvider = Provider.of<NotasProvider>(context);
    String name = notasProvider.name ?? '';
    DateTime now = DateTime.now();
    int hour = now.hour;

    // Determinar el saludo según la hora
    String greeting = getGreeting(hour);
    return Container(
      padding: EdgeInsets.fromLTRB(22, 0, 10, 0),
      margin: EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(notasProvider.photoUrl ?? ''),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 44, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            greeting,
                            style: const TextStyle(
                              fontFamily: 'Mitr',
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              height: 1,
                              color: Color(0xff313131),
                            ),
                             maxLines:
                              1, // Establece el número máximo de líneas que el texto puede ocupar
                          overflow: TextOverflow
                              .ellipsis,
                          ),
                          AutoSizeText(
                            name,
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              color: Color(0xff313131),
                            ),
                            maxLines:
                                1, // Establece el número máximo de líneas que el texto puede ocupar
                            overflow: TextOverflow
                                .ellipsis, // Manejo de desbordamiento
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                          badgeContent: Text('4'),
                          child: Center(
                            child: Icon(
                              Icons.email,
                              color: greyDark, // Color del icono blanco
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15), // Espacio entre los iconos
                      GestureDetector(
                        onTap: () {
                          // Esto abre la pantalla de notificaciones
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[
                                  300], // Gris claro para el fondo del contenedor
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10)),
                          child: badges.Badge(
                            badgeContent: Text('5'),
                            child: Center(
                              child: Icon(
                                Icons.notifications,
                                color: Colors
                                    .grey[800], // Gris oscuro para el icono
                              ),
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
String getGreeting(int hour) {
    if (hour >= 0 && hour < 12) {
      return 'Buenos días';
    } else if (hour >= 12 && hour < 18) {
      return 'Buenas tardes';
    } else {
      return 'Buenas noches';
    }
  }
  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}

