import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewTasks extends StatelessWidget {
  const ViewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TaskApp(),
        backgroundColor: Color(0xffEDFFFB),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 2),
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          children: [
                            Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TaskContents(
                                        context: context,
                                        circleColor: Color(0xff12B19C),
                                        firstText: 'Hoy',
                                        secondText: '1',
                                        iconData: Icons.calendar_today,
                                        iconColor: Colors.white,
                                      ),
                                    
                                    TaskContents(
                                        context: context,
                                        circleColor: Color(0xffF79521),
                                        firstText: 'Programados',
                                        secondText: '6',
                                        iconData: Icons.event_available,
                                        iconColor: Colors.white,
                                      ),
                                    
                                  ]),
                            
                            SizedBox(height: 15),
                            Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TaskContents(
                                      context: context,
                                      circleColor: Color(0xffFD6A6A),
                                      firstText: 'Prioritarios',
                                      secondText: '1',
                                      iconData: Icons.flag,
                                      iconColor: Colors.white,
                                    ),
                                    TaskContents(
                                      context: context,
                                      circleColor: Color(0xff6B6565),
                                      firstText: 'Todos',
                                      secondText: '7',
                                      iconData: Icons.inbox,
                                      iconColor: Colors.white,
                                    )
                                  ]),
                            
                          ],
                        ),
                      ),
            
              
              
              
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.92 ,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f9D9899),
                      offset: Offset(1, -1),
                      blurRadius: 5.5,
                    ),
                  ],
                ),
                child: Container(
                    height: MediaQuery.of(context).size.height ,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Plan Semanal',
                                    style: TextStyle(
                                        fontFamily: 'Mitr',
                                        color: Color(0xff323232),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '7 Tareas',
                                    style: TextStyle(
                                        fontFamily: 'Mitr',
                                        color: Color(0xff4B4B4B),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: MediaQuery.of(context).size.width * 0.5,
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 4),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color(0xff12B19C),
                                  ),
                                  child: Icon(
                                    Icons.calendar_today,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Image.asset('assets/elements/Group 51.png')),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: DateList(),
                          ),
                          Container(height:MediaQuery.of(context).size.height * 0.62,
                          margin: EdgeInsets.only(right: 20),
                          child: EventList()),
                          
                        ]),
                  ),
                
              )
            ],
          ),
        ),
      );
    
  }

  Widget TaskContents({
    required BuildContext context,
    required Color circleColor,
    required String firstText,
    required String secondText,
    required IconData iconData,
    required Color iconColor,
  }) {
    return SizedBox(width: 170,
        child: Expanded(
          child: Container(
              
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(62, 44, 0, 9),
                            offset: Offset(1, -1),
                            blurRadius: 5.5,
                  ),
                ],
              ),
              width: 170,
              height: MediaQuery.of(context).size.height * 0.102,
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: circleColor,
                      ),
                      child: Icon(
                        iconData,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        firstText,
                        style: TextStyle(
                            color: Color(0xff9D9898), fontFamily: 'Mitr', fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.topRight,
                    child: Text(
                      secondText,
                      style: TextStyle(
                          fontSize: 28, fontFamily: 'Mitr', color: Color(0xff4B4B4B)),
                    ),
                  ),
                ),
              ]),
            ),
        ),
      );
    
    
  }

  TaskApp() {
    //Intl.defaultLocale = 'es';
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("d 'de' MMMM", 'es').format(now);

    return AppBar(
      toolbarHeight: 65,
      elevation: 0,
      backgroundColor: Color(0xff12B19C),
      leading: BackButton(),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 72, bottom: 5),
            child: Text(
              'Hoy, ${formattedDate}', // Aquí muestra la fecha
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Arimo',
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
      title: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          'Mis Tareas',
          style: TextStyle(
            fontFamily: 'Mitr',
            fontSize: 34,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class DateList extends StatefulWidget {
  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  int selectedIndex = 0;
  int todayIndex = 0;
  int previousTodayIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Obten la fecha actual
    DateTime currentDate = DateTime.now();
    // Lista de días y fechas
    List<String> dayDateList = [];

    // Agrega los próximos 7 días a la lista
    for (int i = 0; i < 7; i++) {
      dayDateList.add(
        '${_getDayName(currentDate.weekday)} ${currentDate.day} ',
      );
      currentDate = currentDate.add(Duration(days: 1));
    }

    return Container(
      padding: EdgeInsets.only(right: 15),
      height: 40, // Altura deseada
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Desplazamiento horizontal
        itemCount: dayDateList.length,
        itemBuilder: (context, index) {
// Comprueba si es el día de hoy
          return GestureDetector(
            onTap: () {
              setState(() {
                if (index == 0) {
                  // Si tocas el día de hoy nuevamente, vuelve al estado inicial
                  todayIndex = 0;
                  selectedIndex = 0;
                } else {
                  previousTodayIndex = todayIndex; 
                  todayIndex =
                      -1; // Vuelve al estado inicial cualquier otro día seleccionado
                  selectedIndex = index;
                }
              });
            },
            child: Container(
              width: 60,
              height: 40, // Ancho deseado
              margin: EdgeInsets.only(right: 10), // Espacio entre elementos
              decoration: BoxDecoration(
                border: Border.all(
                  color: todayIndex == index
                      ? Color(0xffFD6A6A)
                      : selectedIndex == index
                          ? Colors.white
                          : Color(0xff6B6565),
                ), // Bordes entre elementos
                borderRadius: BorderRadius.circular(10),
                color: todayIndex == index
                    ? const Color(0xffFD6A6A)
                    : selectedIndex == index
                        ? Color(0xffF3B24F)
                        : Colors.white,

                /*color: isToday || selectedIndex == index
                    ? Color(0xffF3B24F)
                    : Colors.white,*/
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  dayDateList[index],
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 16,
                    color: todayIndex == index
                        ? Color.fromARGB(255, 255, 255, 255)
                        : selectedIndex == index
                            ? Colors.white
                            : Color(0xff6B6565),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /* String _getMonthName(int month) {
    // Puedes personalizar este método según tus necesidades
    const monthNames = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre',
    ];
    return monthNames[month - 1];
  }*/
  String _getDayName(int day) {
    // Puedes personalizar este método según tus necesidades
    const dayNames = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
    return dayNames[day - 1];
  }
}
//Lista del dia de hoy
class Event {
  final String title;
  final DateTime startTime;
  final DateTime endTime;

  Event(this.title, this.startTime, this.endTime);
}

class MyEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: EventList(),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  final List<Event> events = [
    Event('Reunión 1', DateTime(2023, 9, 28, 9, 0), DateTime(2023, 9, 28, 10, 0)),
    Event('Reunión 2', DateTime(2023, 9, 28, 10, 30), DateTime(2023, 9, 28, 11, 30)),
    Event('Almuerzo', DateTime(2023, 9, 28, 12, 0), DateTime(2023, 9, 28, 13, 0)),
    Event('Reunión 3', DateTime(2023, 9, 28, 14, 0), DateTime(2023, 9, 28, 15, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentHour = now.hour;
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 24, // Suponiendo un día completo con 24 horas
        itemBuilder: (context, index) {
          final hour = index;
          final hourStart = DateTime(2023, 9, 28, hour);
          final hourEnd = DateTime(2023, 9, 28, hour + 1);
    
          final eventsInHour = events.where((event) {
            return event.startTime.isBefore(hourEnd) && event.endTime.isAfter(hourStart);
          }).toList();
    
          return EventHourRow(hour: hour, events: eventsInHour);
        },
      ),
    );
  }
}

class EventHourRow extends StatelessWidget {
  final int hour;
  final List<Event> events;

  EventHourRow({required this.hour, required this.events});

  @override
  Widget build(BuildContext context) {
    final hourString = '${hour.toString().padLeft(2, '0')}:00';

    return Container(
   
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hourString,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Color(0xff4B4B4B) ),
          ),
          SizedBox(height: 8),
          for (final event in events)
            EventCard(event: event),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm a');
    final startTimeString = timeFormat.format(event.startTime);
    final endTimeString = timeFormat.format(event.endTime);

    return Card(
      elevation: 2,
      color: Color(0xffEDFFFB),
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff4B4B4B)),
            ),
            Text('$startTimeString - $endTimeString', style:TextStyle(color: Color(0xff4B4B4B)),),
          ],
        ),
      ),
    );
  }
}
