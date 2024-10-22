import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:glassmorphism/glassmorphism.dart';

class HomeTeacherScreen extends StatefulWidget {
  const HomeTeacherScreen({super.key});

  @override
  State<HomeTeacherScreen> createState() => _HomeTeacherScreenState();
}

class _HomeTeacherScreenState extends State<HomeTeacherScreen> {
  // List<Widget> fragments =  [HomePage(), MyPerformance(), Calendar(), ProfileTeacher(),];
 
   int currentIndex = 0;
  onTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;

    String greeting = getGreeting(hour);
    CustomAppBarTeacher(greeting);
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      //bottomNavigationBar: CustomeNavigationBar(onTab),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarTeacher(greeting),
            Column(
              children: [
                const SizedBox(height: 10,),
                groupMainTeacher(context),
                 
                 Container(
                  height: MediaQuery.of(context).size.height *1.1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image:AssetImage('assets/images/main.png'),
                    fit: BoxFit.cover )
                  ),
                   child: Column(
                     children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 10),
                        alignment: Alignment.topLeft,
                        child: const Text("Actividades",
                                           style: TextStyle(
                           color: Color(0xff323232),
                           fontSize: 23,
                           fontFamily: 'Mitr'),
                           textAlign: TextAlign.left,),
                      ),
                            const SizedBox(height: 15,),
                            activitysTeachers2(context, 'Sección J20', 'Pruebas Técnicas de Sofware', redStatic, 40, 10, 30),
                       activitysTeachers2(context, 'Sección Q25', 'Nuevas Tendencias Tecnológicas', const Color(0xffF3B24F), 20, 18, 25),
                               
                       activitysTeachers2(context, 'Sección J20','Plataformas Móviles', const Color(0xffEB078D), 40, 10, 30),
                     ],
                   ),
                 )
             
              ],
            ),
          ],
        ),
      ),
    );
  }

Row activitysTeachers2(BuildContext context, String seccion, String title, Color color, double progress2, int alumnosEntregaron2, int totalAlumnos2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.22,
        borderRadius: 10,
        margin: const EdgeInsets.symmetric(vertical: 4),
        blur: 20,
        alignment: Alignment.topCenter,
        border: 0.2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
            const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(right: 110),
              child:  AutoSizeText(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Mitr',
                      fontSize: 20,           // Tamaño de fuente inicial
         
                      ),
                       maxFontSize: 20, // Tamaño máximo de fuente
            minFontSize: 16,
                      maxLines: 1, // Número máximo de líneas permitidas
               overflow: TextOverflow.ellipsis,),
            ),
            Container(
              margin: const EdgeInsets.only(right: 215),
              child: Text(seccion,
                  style: TextStyle(
                      color: color,
                      fontFamily: '',
                      fontSize: 17)),
            ),
            Column(
              children: [
                Transform.translate(
                  offset: const Offset(-45, -23),
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                  ),
                )
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 0),
                    Transform.translate(
                      offset: const Offset(210, 45),
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
                                      color: Colors.grey[200]!,
                                      width: 10,
                                    ),
                                  ),
                                ),
                                CircularProgressIndicator(
                                  value: progress2 / 100,
                                  strokeWidth: 5,
                                  valueColor:
                                     AlwaysStoppedAnimation<Color>(
                                    color,
                                  ),
                                ),
                                Text(
                                  '${progress2.toString()}%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
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
                      offset: const Offset(-100, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: const Offset(5, 20),
                            child: Text(
                              'Entregaron la tarea: $alumnosEntregaron2/$totalAlumnos2',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: '',
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Transform.translate(
                            offset: const Offset(10, 35),
                            child: Container(
                              width: 200,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 240 *
                                        (alumnosEntregaron2 / totalAlumnos2),
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 2),
                                      child: Text(
                                        '$progress2',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
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
    ],
  );
}

  Row activitysTeachers(double progress, int alumnosEntregaron, int totalAlumnos) {
    return Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(28, -90),
                      child: Container(
                        height: 180,
                        width: 340,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 155, 144, 232),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(right: 110),
                              child: const Text("Plataformas Móviles",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Mitr',
                                      fontSize: 20)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 215),
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
                                  offset: const Offset(-45, -23),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                  ),
                                )
                              ],
                            ),
                            Transform.translate(
                              offset: const Offset(0, -40),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 0),
                                    Transform.translate(
                                      offset: const Offset(210, 45),
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
                                      offset: const Offset(-100, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Transform.translate(
                                            offset: const Offset(5, 20),
                                            child: Text(
                                              'Entregaron la tarea: $alumnosEntregaron/$totalAlumnos',
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontFamily: '',
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Transform.translate(
                                            offset: const Offset(10, 35),
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
                                                          const Color(0xff0BB49D),
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
                                    const SizedBox(width: 10),
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
                                    const SizedBox(width: 10),
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
                                    const SizedBox(width: 10),
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
                                    const SizedBox(width: 10),
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
                                    const SizedBox(width: 10),
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
                                    const SizedBox(width: 10),
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
                  
                );
  }

  Widget groupMainTeacher(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.4,
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *0.46,
                    height: MediaQuery.of(context).size.height *0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                         // margin: EdgeInsets.only(bottom: 70),
                          height: MediaQuery.of(context).size.height * 0.16,
                         // width: MediaQuery.of(context).size.width * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment(0, -0),
                              radius: 0.5,
                              colors: <Color>[
                                Color.fromARGB(155, 239, 145, 14),
                                Color(0xffF79521)
                              ],
                              stops: <double>[0, 0.984],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 70,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: greyOpa,
                                  ),
                                  child: Image.asset(
                                      'assets/images/recursos1.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 0),
                              const Text("Tareas",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      height: 0.95,
                                      fontFamily: 'Mitr',
                                    ),)
                            ],
                          ),
                        ),
                        
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.46,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const RadialGradient(
                                center: Alignment(0, -0),
                                radius: 0.5,
                                colors: <Color>[
                                  Color.fromARGB(255, 200, 212, 32),
                                  Color(0xffC9D32B)
                                ],
                                stops: <double>[0, 0.984],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 70,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greyOpa,
                                    ),
                                    child: Image.asset(
                                       'assets/images/gestion_calificaciones.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Gestión de Calificaciones",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    height: 0.95,
                                    fontFamily: 'Mitr',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *0.46,
                    height: MediaQuery.of(context).size.height *0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Container(
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const RadialGradient(
                              center: Alignment(0, -0),
                              radius: 0.5,
                              colors: <Color>[
                                Color.fromARGB(255, 200, 212, 32),
                                Color(0xffC9D32B)
                              ],
                              stops: <double>[0, 0.984],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 70,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: greyOpa,
                                  ),
                                  child: Image.asset(
                                      'assets/images/clases_secciones.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Cursos y Secciones",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      height: 0.95,
                                      fontFamily: 'Mitr',
                                    ),
                              )
                            ],
                          ),
                        ),
                        
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 0.46,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const RadialGradient(
                                center: Alignment(0, -0),
                                radius: 0.5,
                                colors: <Color>[
                                  Color.fromARGB(255, 15, 210, 184),
                                  Color(0XFF0BB49D),
                                ],
                                stops: <double>[0, 0.984],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greyOpa,
                                    ),
                                    child: Image.asset(
                                        'assets/images/calendario.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text("Horario",
                                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    height: 0.95,
                                    fontFamily: 'Mitr',
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        
                      ],
                  
                    ),
                  ),
                   ],
              ),
    );
  }
}

Container CustomAppBarTeacher(String greeting) {
  return Container(
    padding: const EdgeInsets.fromLTRB(22, 0, 10, 0),
    margin: const EdgeInsets.only(top: 30),
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 6, 44, 0),
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
          margin: const EdgeInsets.only(top: 6),
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
                        badgeContent: const Text('4'),
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
                        child: badges.Badge(
                          badgeContent: const Text('5'),
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
