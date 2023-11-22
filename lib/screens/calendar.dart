import 'package:becertus_proyecto/models/to_do_card.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:flutter/material.dart';
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
          SizedBox(height: 15),
          Container(
            height: 610,
            width: 0,
            decoration: const BoxDecoration(
              color:  Color(0xffEDFFFB),
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
                /*
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Calendario",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Mitr",
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                
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

                //Segunda fila (Botones)
                Container(
                  height: 50,
                  width: 450,
                  decoration: const BoxDecoration(
                    color: Color(0XFFE7E2E2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
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
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              color: selectedND == 0
                                  ? Color(0xFFFD6A6A)
                                  : Color.fromARGB(255, 247, 245, 245),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25)),
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
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                                color: selectedND == 1
                                    ? Color(0xFFFD6A6A)
                                    : Color.fromARGB(255, 247, 245, 245)),
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
                            height: 50,
                            width: 132.7,
                            decoration: BoxDecoration(
                                color: selectedND == 2
                                    ? Color(0xFFFD6A6A)
                                    : Color.fromARGB(255, 247, 245, 245),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(25))),
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
                // Celendario -----
                const SizedBox(height: 20),
                Text(
                    "Día seleccionado: " +
                        _selectedDay.toString().split(" ")[0],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: "Arimo",
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 235),
                    const Column(
                      children: [
                        Text("Programar",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Arimo",
                                fontWeight: FontWeight.w600))
                      ],
                    ),
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
                                    "Nombrar nueva fecha: ",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.black,
                                        fontFamily: "Mitr",
                                        fontWeight: FontWeight.w400),
                                  ),
                                  content: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: TextField(
                                      controller: _eventController,
                                      style: const TextStyle(
                                          fontFamily: "Mitr",
                                          fontSize: 19,
                                          color: Colors.black),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Cerrar el cuadro
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancelar",
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        events.addAll({
                                          _selectedDay!: [
                                            Event(_eventController.text)
                                          ]
                                        });
                                        Navigator.of(context).pop();
                                        _selectedEvents.value =
                                            _getEventsForDay(_selectedDay!);
                                      },
                                      child: Text("Enviar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(Icons.add, size: 30),
                          backgroundColor: Color(0xFFFD6A6A),
                          foregroundColor: Colors.white,
                          heroTag: null,
                          mini: true,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  color: Color.fromARGB(255, 247, 235, 235),
                  child: Column(
                    children: [
                      TableCalendar(
                        locale: 'es_ES',
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _focusedDay,
                        onDaySelected: _onDaySelected,
                        selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                        rowHeight: 50,
                        //Evento:
                        eventLoader: _getEventsForDay,
                        calendarStyle: CalendarStyle(
                          defaultTextStyle: TextStyle(color: Colors.black),
                          weekendTextStyle: TextStyle(color: Colors.black),
                        ),
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            color: Colors.black,
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
                SizedBox(height: 5),
                Expanded(
                  child: ValueListenableBuilder<List<Event>>(
                      valueListenable: _selectedEvents,
                      builder: (context, value, _) {
                        return ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  onTap: () => print(""),
                                  title: Text('${value[index].title}'),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      _showDeleteDialog(context, value[index]);
                                    },
                                  ),
                                ),
                              );
                            });
                      }),
                ),
              ],
            ),
          ),
          Container(
            height: 420,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(blurRadius: 2, spreadRadius: 0, color: Colors.grey)
              ]
            ),
            
            child: Column(
              children: [
                const SizedBox(height: 15),
                Column(
                  children: [
                    Center(
                      child: Center(
                        child: Titles(
                          text: 'Tareas Pendientes',
                          size: 24,
                          fontFamily: 'Mitr',
                        ),
                      ),
                    ),
                  ],
                ),
                const _ToDoCard()
              ],
            ),
          ),

          //Lllamando al Widgets de Tareas pendientes ---
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("¿Eliminar evento?"),
          content: Text("¿Estás seguro de que quieres eliminar este evento?"),
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
