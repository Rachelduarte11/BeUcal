import 'package:becertus_proyecto/models/to_do_card.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  // 0: Todos, 1: ND1, 2: ND2, 3: ND3

  int selectedND = 0; 

  //Función clic para los botones y cambio de color

  int selectedButton = 0;

  Color colorND1 = const Color(0xFFFD6A6A);
  Color colorND2 = const Color(0XFFE7E2E2);
  Color colorND3 = const Color(0XFFE7E2E2);

  Color textColorND1 = Colors.white;
  Color textColorND2 = Colors.black;
  Color textColorND3 = Colors.black;
  
  DateTime today() => DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Container(
            height: 500,
            width: 0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey),
              ],
            ),
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                  const Column(
                      children: [
                        Text(
                          "Calendario",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Arimo",
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                /*
                Row(
                  children: [
                    const SizedBox(width: 25),
                  
                    SizedBox(width: 80),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: selectedButton == 0
                                    ? Color(0xFFFD6A6A)
                                    : Color(0XFFE7E2E2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 30,
                              color: selectedButton == 0
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedButton = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: selectedButton == 1
                                    ? Color(0xFFFD6A6A)
                                    : Color(0XFFE7E2E2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: selectedButton == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),*/
                SizedBox(height: 20),
                //Segunda fila (Botones)
                Container(
                  height: 30,
                  width: 230,
                  decoration: const BoxDecoration(
                      color: Color(0XFFE7E2E2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  child: Center(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedND = 0;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 76.6,
                            decoration: BoxDecoration(
                              color: selectedND == 0
                                  ? Color(0xFFFD6A6A)
                                  : Color(0XFFE7E2E2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                "Todos",
                                style: TextStyle(
                                  color: selectedND == 0
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Mitr",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedND = 1;
                            });
                          },
                          child: Container(
                            width: 76.6,
                            height: 30,
                            decoration: BoxDecoration(
                              color: selectedND == 1
                                  ? Color(0xFFFD6A6A)
                                  : Color(0XFFE7E2E2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                "Tareas",
                                style: TextStyle(
                                  color: selectedND == 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Mitr",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedND = 2;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 76.6,
                            decoration: BoxDecoration(
                              color: selectedND == 2
                                  ? Color(0xFFFD6A6A)
                                  : Color(0XFFE7E2E2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                "Pruebas",
                                style: TextStyle(
                                  color: selectedND == 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 15,
                                  fontFamily: "Mitr",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Celendario -----
                Container(
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    rowHeight: 50,
                    calendarStyle: const CalendarStyle(
                      defaultTextStyle: TextStyle(color: Colors.black), // Cambia el color aquí
                      weekendTextStyle: TextStyle(color: Colors.black), // Cambia el color aquí
                      outsideTextStyle: TextStyle(color: Colors.grey), // Para días fuera del me
                    ),
                    locale: 'es_ES',
                    availableGestures: AvailableGestures.all,
                    //Titulos edición de calendario meses
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        ), titleCentered: true,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          //Lllamando al Widgets de Tareas pendientes ---
          SizedBox(height: 10),
          Center(
            child: Titles(
              text: 'Tareas Pendientes',
              size: 24,
              fontFamily: 'Mitr',
            ),
          ),
          _ToDoCard()
        ],
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
        ],
      ),
    );
  }
}
