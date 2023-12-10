import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:flutter/material.dart';

class HomeTeacherScreen extends StatelessWidget {
  const HomeTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;

    String greeting = getGreeting(hour);
    final double progress = 70;
    final int alumnosEntregaron = 28;
    final int totalAlumnos = 32;

    final double progress2 = 50;
    final int alumnosEntregaron2 = 20;
    final int totalAlumnos2 = 40;
    CustomAppBarTeacher(greeting);
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      body: Column(
        children: [
          CustomAppBarTeacher(greeting),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 70),
                        height: 140,
                        width: 165,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(101, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.asset(
                                    'assets/images/recursos1.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(height: 0),
                            const Text("Tareas",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'Mitr',
                                ))
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 210,
                        width: 165,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 179, 201, 68),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                height: 70,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(101, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.asset(
                                    'assets/images/recursos1.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(height: 10),
                            const Text(
                              "Cursos y Secciones",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'Mitr',
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 210,
                        width: 165,
                        child: Transform.translate(
                          offset: Offset(0.0, -80.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 179, 201, 68),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(101, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Image.asset(
                                        'assets/images/logros.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(height: 10),
                                const Text(
                                  "Gestión de Calificaciones",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'Mitr',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 140,
                        width: 165,
                        child: Transform.translate(
                          offset: Offset(0, -45),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff0BB49D),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(101, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Image.asset(
                                        'assets/images/logros.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(height: 0),
                                const Text("Horario",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Mitr',
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.translate(
                        offset: Offset(30, -70),
                        child: Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: const Text("Actividades",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontFamily: 'Mitr'))),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Transform.translate(
                        offset: Offset(28, -90),
                        child: Container(
                          height: 180,
                          width: 340,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 155, 144, 232),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(right: 110),
                                child: const Text("Plataformas Móviles",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mitr',
                                        fontSize: 20)),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 215),
                                child: const Text("Sección: I03",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 19, 208, 183),
                                        fontFamily: '',
                                        fontSize: 17)),
                              ),
                               Column(
                                children: [
                                  Transform.translate(
                                    offset: Offset(-45, -23),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                    ),
                                  )
                                ],
                              ),
                              Transform.translate(
                                offset: Offset(0, -40),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 0),
                                      Transform.translate(
                                        offset: Offset(210, 45),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    width: 70,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Colors.grey[300]!,
                                                        width: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  CircularProgressIndicator(
                                                    value: progress / 100,
                                                    strokeWidth: 5,
                                                    valueColor:
                                                        const AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0xff0BB49D),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${progress.toString()}%',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(-100, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Transform.translate(
                                              offset: Offset(5, 20),
                                              child: Text(
                                                'Entregaron la tarea: $alumnosEntregaron/$totalAlumnos',
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: '',
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Transform.translate(
                                              offset: Offset(10, 35),
                                              child: Container(
                                                width: 200,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 180 *
                                                          (alumnosEntregaron /
                                                              totalAlumnos),
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff0BB49D),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 40,
                                                                top: 2),
                                                        child: Text(
                                                          '70%',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /*
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('I01',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontSize: 17,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('I01',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontSize: 17,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('I01',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontSize: 17,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('I01',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontSize: 17,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.lightGreen,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('I01',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontSize: 17,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('I01',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontSize: 17,
                                              )),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text('I01',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Mitr',
                                                fontSize: 17,
                                              )),
                                        ),
                                      ),*/
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Transform.translate(
                        offset: Offset(28, -90),
                        child: Container(
                          height: 180,
                          width: 340,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 163, 232, 144),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.only(right: 110),
                                child: const Text("Pruebas de Software",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Mitr',
                                        fontSize: 20)),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 215),
                                child: const Text("Sección: OA1",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 25, 166, 147),
                                        fontFamily: '',
                                        fontSize: 17)),
                              ),
                              Column(
                                children: [
                                  Transform.translate(
                                    offset: Offset(-45, -23),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                    ),
                                  )
                                ],
                              ),
                              Transform.translate(
                                offset: Offset(0, -40),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 0),
                                      Transform.translate(
                                        offset: Offset(210, 45),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    width: 70,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Colors.grey[200]!,
                                                        width: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  CircularProgressIndicator(
                                                    value: progress2 / 100,
                                                    strokeWidth: 5,
                                                    valueColor:
                                                        const AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0xff0BB49D),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${progress2.toString()}%',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(-100, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Transform.translate(
                                              offset: Offset(5, 20),
                                              child: Text(
                                                'Entregaron la tarea: $alumnosEntregaron2/$totalAlumnos2',
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: '',
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Transform.translate(
                                              offset: Offset(10, 35),
                                              child: Container(
                                                width: 200,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 240 *
                                                          (alumnosEntregaron2 /
                                                              totalAlumnos2),
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff0BB49D),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                top: 2),
                                                        child: Text(
                                                          '50%',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container CustomAppBarTeacher(String greeting) {
  return Container(
    padding: EdgeInsets.fromLTRB(22, 0, 10, 0),
    margin: EdgeInsets.only(top: 30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/StackPath.jpeg"),
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
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(
                          "Jenner",
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
                              .ellipsis, // Manejo de desbordamiento,
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
                      child: Badge(
                        //badgeContent: Text('4'),
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
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()),
                        );*/
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[
                                300], // Gris claro para el fondo del contenedor
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        child: Badge(
                          //badgeContent: Text('5'),
                          child: Center(
                            child: Icon(
                              Icons.notifications,
                              color:
                                  Colors.grey[800], // Gris oscuro para el icono
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
