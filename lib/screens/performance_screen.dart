import 'package:becertus_proyecto/screens/main_performance.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:flutter/material.dart';

class MyPerformance extends StatefulWidget {
  const MyPerformance({Key? key}) : super(key: key);

  @override
  _MyPerformanceState createState() => _MyPerformanceState();
}

class _MyPerformanceState extends State<MyPerformance> {
  bool isExpandedEnfoque = false;
  bool isExpandedEstudiosGenerales = false;
  bool isExpandedFormacionProfesional = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            // Encabezado con información del usuario
            
            // Secciones desplegables para el ciclo y el curso
            Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Row(
                    children: [
                      Text(
                        "Ciclo:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mitr",
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("II",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0BB49D),
                            fontWeight: FontWeight.w800,
                            fontFamily: "II",
                          )),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Curso:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mitr",
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("Todos",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0BB49D),
                            fontFamily: "II",
                            fontWeight: FontWeight.w800,
                          )),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                      ),
                    ],
                  ),
                ),
                MainPerformance(),
              ],
            ),
            //Sección tabla png
            Container(
              width: 370,
              height: 290,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/tabla.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Sección para Estudios Generales
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpandedEstudiosGenerales = !isExpandedEstudiosGenerales;
                  });
                },
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 25,
                                top: 10,
                                bottom: 5,
                              ),
                              child: Text(
                                "Estudios Generales",
                                style: TextStyle(
                                  fontFamily: "Mitr",
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isExpandedEstudiosGenerales
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            iconSize: 35,
                            onPressed: () {
                              setState(() {
                                isExpandedEstudiosGenerales =
                                    !isExpandedEstudiosGenerales;
                              });
                            },
                          ),
                        ],
                      ),
                      if (isExpandedEstudiosGenerales)
                        Image.asset(
                          'assets/images/estudios_generales_muestra.PNG',
                          width: 420,
                          height: 250,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            // Sección para Formación Profesional
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpandedFormacionProfesional =
                        !isExpandedFormacionProfesional;
                  });
                },
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 25,
                                top: 10,
                                bottom: 5,
                              ),
                              child: Text(
                                "Formación Profesional",
                                style: TextStyle(
                                  fontFamily: "Mitr",
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isExpandedFormacionProfesional
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            iconSize: 35,
                            onPressed: () {
                              setState(() {
                                isExpandedFormacionProfesional =
                                    !isExpandedFormacionProfesional;
                              });
                            },
                          ),
                        ],
                      ),
                      if (isExpandedFormacionProfesional)
                        Image.asset(
                          'assets/images/formacion_profesional_muestra.PNG',
                          width: 420,
                          height: 250,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpandedEnfoque = !isExpandedEnfoque;
                  });
                },
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 25,
                                top: 10,
                                bottom: 5,
                              ),
                              child: Text(
                                "Enfoque Estratégico de Diseño Arquitectónico",
                                style: TextStyle(
                                  fontFamily: "Mitr",
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isExpandedEnfoque
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            iconSize: 35,
                            onPressed: () {
                              setState(() {
                                isExpandedEnfoque = !isExpandedEnfoque;
                              });
                            },
                          ),
                        ],
                      ),
                      if (isExpandedEnfoque)
                        Image.asset(
                          'assets/images/StackPath.jpeg',
                          width: 150,
                          height: 130,
                        ),
                    ],
                  ),
                ),
                
              ),
            ),  
          ],
        ),
      ),
    );
  }
}

/*
*/
