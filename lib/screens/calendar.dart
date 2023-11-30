import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/models/to_do_card.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  void _deleteEvent(Event event) {
    setState(() {
      events[_selectedDay!]?.remove(event);
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    });
  }

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

  //Calendario

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  //historia de eventos
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  //Titulos con Mayúsculas

  String capitalize(String s) {
    return s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 0),
          Container(
            height: 550,
            decoration: const BoxDecoration(
              color: Color(0xffEDFFFB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                //BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey),
              ],
            ),
            child: Column(
              children: [
                //Segunda fila (Botones)
                /*
                Container(
                  height: 30,
                  width: 335,
                  decoration: const BoxDecoration(
                    color: Color(0XFFE7E2E2),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            height: 25,
                            width: 111.6,
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
                                      ? Color(0XFFE7E2E2)
                                      : Colors.black,
                                  fontSize: 14,
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
                            height: 25,
                            width: 111.6,
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
                                  fontSize: 14,
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
                            width: 111.6,
                            height: 25,
                            decoration: BoxDecoration(
                              color: selectedND == 2
                                  ? Color(0xFFFD6A6A)
                                  : Color(0XFFE7E2E2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                "Info",
                                style: TextStyle(
                                  color: selectedND == 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14,
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
                */
                // Celendario -----
                const SizedBox(height: 10),
                SizedBox(height: 20),
                Container(
                  height: 480,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3, spreadRadius: 0, color: Colors.grey),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          color: const Color.fromRGBO(18, 177, 158, 1),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(0)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Calendario',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      18, 177, 158, 1),
                                                  Color.fromRGBO(
                                                      18, 177, 158, 1),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(50)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.calendar_view_day,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Día seleccionado: " +
                                                      _selectedDay
                                                          .toString()
                                                          .split(" ")[0],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontFamily: "Arimo",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    scrollable: true,
                                                    title: const Text(
                                                      "Agendar reunión",
                                                      style: TextStyle(
                                                        fontSize: 19,
                                                        color: Colors.black,
                                                        fontFamily: "Mitr",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    content: Padding(
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      child: TextField(
                                                        controller:
                                                            _eventController,
                                                        style: const TextStyle(
                                                          fontFamily: "Mitr",
                                                          fontSize: 19,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          // Cerrar el cuadro
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            "Cancelar",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .red)),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          events.addAll({
                                                            _selectedDay!: [
                                                              Event(
                                                                  _eventController
                                                                      .text)
                                                            ]
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                          _selectedEvents
                                                                  .value =
                                                              _getEventsForDay(
                                                                  _selectedDay!);
                                                        },
                                                        child: Text("Enviar"),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(Icons.note_alt_rounded,
                                                size: 25),
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 225, 110, 56),
                                            foregroundColor: Colors.white,
                                            heroTag: true,
                                            mini: true,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      TableCalendar(
                        locale: 'es_ES',
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _focusedDay,
                        onDaySelected: _onDaySelected,
                        selectedDayPredicate: (day) =>
                            isSameDay(day, _selectedDay),
                        rowHeight: 45,
                        //Evento:
                        eventLoader: _getEventsForDay,
                        calendarStyle: const CalendarStyle(
                          defaultTextStyle: TextStyle(color: Colors.black),
                          weekendTextStyle: TextStyle(color: Colors.black),
                          selectedDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromRGBO(18, 177, 158, 1),
                          ),
                          selectedTextStyle: TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(110, 18, 177, 158),
                          ),
                          todayTextStyle: TextStyle(color: Colors.white),
                        ),
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        calendarBuilders: CalendarBuilders(
                          headerTitleBuilder: (context, DateTime focusDay) {
                            return Text(
                              DateFormat.yMMM('es_ES')
                                  .format(focusDay)
                                  .replaceFirstMapped(RegExp(r'^[a-z]'),
                                      (match) => match.group(0)!.toUpperCase()),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Reuniones -----
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text(
              "Recién agregado",
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Mitr',
                color: Color.fromARGB(255, 108, 106, 106),
              ),
            ),
          ),
          SizedBox(height: 10),
         Container(
  height: 120,
  width: 240,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey),
    ],
  ),
  child: StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('estudiantes')
        .doc('kDkChIpT6jK1gIemu3kX')
        .collection('tareas')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }

      var tasks = snapshot.data!.docs;

      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return Container(
            height: 120,
            width: 240,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0,
                  color: Colors.grey,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Título: ${task['titulo']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Notas: ${task['notas']}'),
                // Puedes agregar más información según tus necesidades
              ],
            ),
          );
        },
      );
    },
  ),
),

          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text(
              "Reuniones",
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Mitr',
                color: Color.fromARGB(255, 108, 106, 106),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 120,
            width: 240,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: ValueListenableBuilder<List<Event>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(255, 225, 110, 56),
                            ),
                            child: ListTile(
                              onTap: () => print(""),
                              title: Text(
                                '${value[index].title}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Mitr',
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.white,
                                onPressed: () {
                                  _showDeleteDialog(context, value[index]);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Horario ----
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: const Text("Mi Horario",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Mitr',
                  color: Color.fromARGB(255, 108, 106, 106),
                )),
          ),
          SizedBox(height: 10),
          Container(
            height: 385,
            width: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey)
                ]),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: const Color.fromRGBO(18, 177, 158, 1),
                      ),
                    ),
                    SizedBox(width: 10),
                    const Text("8:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Arimo')),
                    const SizedBox(width: 2),
                    const Text(
                      "AM",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: 'Arimo'),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 225, 110, 56),
                      ),
                    ),
                    SizedBox(width: 10),
                    const Text("10:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Arimo')),
                    const SizedBox(width: 2),
                    const Text(
                      "AM",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: 'Arimo'),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 40,
                      decoration: const BoxDecoration(color: Colors.lightBlue),
                    ),
                    SizedBox(width: 10),
                    const Text("12:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Arimo')),
                    const SizedBox(width: 2),
                    const Text(
                      "PM",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: 'Arimo'),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 40,
                      decoration: const BoxDecoration(color: Colors.yellow),
                    ),
                    SizedBox(width: 10),
                    const Text("2:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'Arimo')),
                    const SizedBox(width: 2),
                    const Text(
                      "PM",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: 'Arimo'),
                    ),
                  ],
                )
              ],
            ),
          ),
          //Tareas retrasdas -----
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: const Text("Tareas retrasadas",
                style: TextStyle(
                  color: Color.fromARGB(255, 108, 106, 106),
                  fontFamily: 'Mitr',
                  fontSize: 19,
                )),
          ),
          SizedBox(height: 10),
          Container(
            height: 260,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey)
              ],
            ),
            child: const Column(
              children: [
                SizedBox(height: 15),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _ToDoCard(),
                        // Otro contenido aquí
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 0),
        ],
      ),
    );
  }

  //Evento eliminar fecha
  void _showDeleteDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Se eleminará la Reunión.",
              style: TextStyle(color: Colors.black)),
          content: Text(
            "¿Estás seguro de que quieres eliminar este evento?",
            style: TextStyle(color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteEvent(event);
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }
}

class Event {
  final String title;
  Event(this.title);
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
