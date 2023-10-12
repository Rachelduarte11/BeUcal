import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/screens/add_to_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

typedef VoidCallbackParam = Function(int index);

// ignore: must_be_immutable
class CustomeNavigationBar extends StatelessWidget {
  VoidCallbackParam voidCallbackParam;
  CustomeNavigationBar(this.voidCallbackParam, {super.key});

 

//barra de menu
  @override
  Widget build(BuildContext context) {
      return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft:
                Radius.circular(24.0), // Radio en la esquina superior izquierda
            topRight:
                Radius.circular(24.0), // Radio en la esquina superior derecha
          ),
          child: BottomNavigationBar(
            onTap: voidCallbackParam,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFFE2E2E2),
            showUnselectedLabels: false,
            showSelectedLabels: false,
         //   currentIndex: index,
            unselectedItemColor: const Color.fromARGB(255, 107, 107, 107),
            selectedItemColor: greyDark,
            
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                    size: 32,
                  ),
                  label: 'Home',
                  backgroundColor: Colors.amber),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.stacked_bar_chart_rounded,
                  size: 32,
                ),
                label: 'Stack',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_outlined,
                  size: 32,
                ),
                label: 'Play',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  child: SpeedDial(
                    buttonSize: const Size.fromRadius(20),
                    backgroundColor: const Color(0xFFFD6A6A),
                    overlayColor: Colors.black,
                    overlayOpacity: 0.4,
                    spaceBetweenChildren: 5,
                    child: Icon(
                      Icons.add_rounded,
                      size: 36,
                    ),
                    children: [
                      SpeedDialChild(
                        labelWidget: Container(
                          width: 180,
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal:
                                  8), // Espacio alrededor del contenedor
                          decoration: BoxDecoration(
                            color: redStatic, // Color de fondo personalizado
                            borderRadius: BorderRadius.circular(
                                30.0), // Bordes redondeados
                          ),
                          child: const Text(
                            'Calendario',
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontWeight: FontWeight.w400,
                              fontSize: 18, // Tamaño de fuente personalizado
                              color: Colors.white, // Color del texto
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) => AddToDo()),
                          );
                        },
                      ),
                      SpeedDialChild(
                        labelWidget: Container(
                          width: 180,
                          padding: const EdgeInsets.all(
                              4.0), // Espacio alrededor del contenedor
                          decoration: BoxDecoration(
                            color: redStatic, // Color de fondo personalizado
                            borderRadius: BorderRadius.circular(
                                30.0), // Bordes redondeados
                          ),
                          child: const Text(
                            'Nuevo Evento',
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontWeight: FontWeight.w400,
                              fontSize: 18, // Tamaño de fuente personalizado
                              color: Colors.white, // Color del texto
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) => AddToDo()),
                          );
                        },
                      ),
                      SpeedDialChild(
                        labelWidget: Container(
                          width: 180,
                          padding: const EdgeInsets.all(
                              4.0), // Espacio alrededor del contenedor
                          decoration: BoxDecoration(
                            color: redStatic, // Color de fondo personalizado
                            borderRadius: BorderRadius.circular(
                                30.0), // Bordes redondeados
                          ),
                          child: const Text(
                            'Tareas',
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontWeight: FontWeight.w400,
                              fontSize: 18, // Tamaño de fuente personalizado
                              color: Colors.white, // Color del texto
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (builder) => AddToDo()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                label: 'Add',
              )
            ],
        ),
       
      );
  }
}
