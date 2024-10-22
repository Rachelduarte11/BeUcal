import 'package:becertus_proyecto/Students/models/to_do_card.dart';
import 'package:becertus_proyecto/Students/screens/home.dart';
import 'package:becertus_proyecto/Students/screens/performance_screen.dart';
import 'package:becertus_proyecto/Students/screens/profile.dart';
import 'package:becertus_proyecto/Students/widgets/chip_data.dart';
import 'package:becertus_proyecto/Students/widgets/header_section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
 
 
 


   //const Calendar( this.showBottomNavBar, {Key? key}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
   bool showBottomNavBar= true;
 
  final List<Widget> screens = [
    const HomePage(),
    const MyPerformance(),
    Calendar(),
    const MyProfile(),
  ];

  int currentIndex = 5;
 

  void onTab(int index) {
    if (index == 0) {
      Navigator.of(context).pop(); // Regresar a HomePage
    } else {
      setState(() {
        currentIndex = index; // Ajustar índice para la nueva lista
      });
    }
  }

  bool isExpanded = false;
  bool isSwiped = false;
  TextEditingController notesController = TextEditingController();

  void _deleteEvent(Event event) {
    setState(() {
      events[_selectedDay!]?.remove(event);
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    });
  }


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
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 0),
          Container(
            height: 540,
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
                
                // Celendario -----
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    height: 485,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
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
                            color: Color.fromRGBO(18, 177, 158, 1),
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
                                        const SizedBox(width: 20),
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
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
                                                        right: Radius.circular(
                                                            50)),
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
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "Día seleccionado: ${_selectedDay
                                                            .toString()
                                                            .split(" ")[0]}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontFamily: "Arimo",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
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
                                                            const EdgeInsets.all(0),
                                                        child: TextField(
                                                          controller:
                                                              _eventController,
                                                          style:
                                                              const TextStyle(
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
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                            "Cancelar",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            // Agregar la reunión a la lista de eventos
                                                            _selectedEvents
                                                                    .value =
                                                                List.from(
                                                                    _selectedEvents
                                                                        .value)
                                                                  ..add(Event(
                                                                      _eventController
                                                                          .text));
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text("Enviar"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 225, 110, 56),
                                              foregroundColor: Colors.white,
                                              heroTag: true,
                                              mini: true,
                                              child: const Icon(
                                                  Icons.note_alt_rounded,
                                                  size: 25),
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
                              color: Color.fromRGBO(18, 177, 158, 1),
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
                                    .replaceFirstMapped(
                                        RegExp(r'^[a-z]'),
                                        (match) =>
                                            match.group(0)!.toUpperCase()),
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
                ),
              ],
            ),
          ),
          // Tareas recien agregadas -----
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text(
              "Tareas recién agregadas",
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Mitr',
                color: Color.fromARGB(255, 108, 106, 106),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 315,
            width: 300,
           
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 0,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('estudiantes')
                  .doc('eGYtAQiyan12554BOG6D')
                  .collection('tareas')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay tareas agregadas',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Arimo',
                      ),
                    ),
                  );
                }
                var tasks = snapshot.data!.docs;
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: tasks.map((task) {
                        return addNewTask(task, context, false, DateFormat.ABBR_MONTH_DAY);
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          // Reunionnes -----------
          const SizedBox(height: 20),
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
          const SizedBox(height: 10),
          Container(
            height: 120,
            width: 240,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
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
                      if (value.isEmpty) {
                        return const Center(
                          child: Text(
                            'No hay reuniones agregadas para esta fecha',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Arimo',
                              fontSize: 15.5,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(18, 177, 158, 1),
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
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: const Text("Mi Horario",
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Mitr',
                color: Color.fromARGB(255, 108, 106, 106),
              )),
        ),
        const SizedBox(height: 10),
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
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(18, 177, 158, 1),
                    ),
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(height: 80),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 225, 110, 56),
                    ),
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(height: 80),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 40,
                    decoration: const BoxDecoration(color: Colors.lightBlue),
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(height: 80),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 40,
                    decoration: const BoxDecoration(color: Colors.yellow),
                  ),
                  const SizedBox(width: 10),
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
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: const Text("Tareas retrasadas",
              style: TextStyle(
                color: Color.fromARGB(255, 108, 106, 106),
                fontFamily: 'Mitr',
                fontSize: 19,
              )),
        ),
        const SizedBox(height: 10),
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
      )
    );
  }



  Container addNewTask(QueryDocumentSnapshot<Map<String, dynamic>> task, BuildContext context, bool check, String timeTask) {
     return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height:
          isExpanded ? 120 : 65, // Cambiar la altura según si está expandido
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(51, 0, 0, 0),
            offset: Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Theme(
                data: ThemeData(
                  primarySwatch: Colors.green,
                  unselectedWidgetColor: const Color(0xff44DECC),
                ),
                child: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    shape: const CircleBorder(),
                    activeColor: const Color(0xff44DECC),
                    checkColor: const Color.fromARGB(255, 249, 249, 249),
                    value: check,
                    onChanged: (Bool) {},
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${task['titulo']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arimo',
                        color: Color(0xFF323232),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${DateTime.now()}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontFamily: 'Arimo',
                        color: Color(0xFF323232),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  /*  Text(
                      '${task['notas']}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Arimo',
                        color: Color(0xFF323232),
                        fontWeight: FontWeight.w500,
                      ),
                    ),*/
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded =
                        !isExpanded; // Cambia el estado al tocar la flecha
                  });
                },
                child: Row(
                  children: [
                    //chip,
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 200, 78, 69),
                      ),
                      onPressed: () {
                        _mostrarDialogoEliminar(context, task.id);
                      },
                    ),
                    Image.asset(
                      'assets/elements/flecha-hacia-abajo-para-navegar (1).png',
                      width: 18,
                      height: 18,
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
          if (isExpanded)
            Container(
              // Aquí puedes agregar detalles adicionales cuando está expandido
              padding: const EdgeInsets.all(16),
              child: Text(
                '${task['notas']}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF323232),
                ),
              ),
            ),
        ],
      ),
    );
  }

  //W Evento eliminar reunion
  void _showDeleteDialog(BuildContext context, Event event) {

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Se eleminará la Reunión.",
              style: TextStyle(color: Colors.black)),
          content: const Text(
            "¿Estás seguro de que quieres eliminar este evento?",
            style: TextStyle(color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteEvent(event);
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: const Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }
}

//Eliminar nuevas tareas ---
void _borrarTareaFirestore(String tareaId) async {
  try {
    await FirebaseFirestore.instance
        .collection('estudiantes')
        .doc('eGYtAQiyan12554BOG6D')
        .collection('tareas')
        .doc(tareaId)
        .delete();
  } catch (error) {
  }
}

void _mostrarDialogoEliminar(BuildContext context, String tareaId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmar eliminación.',
            style: TextStyle(
              color: Colors.black,
            )),
        content: const Text(
          '¿Estás seguro de que deseas eliminar esta tarea?',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              _borrarTareaFirestore(tareaId);
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text(
              'Eliminar',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}

//

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
      padding: const EdgeInsets.all(15),
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
