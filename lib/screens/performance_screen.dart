import 'package:becertus_proyecto/screens/main_performance.dart';
import 'package:becertus_proyecto/screens/nd1_performace.dart';
import 'package:becertus_proyecto/screens/nd2_performance.dart';
import 'package:becertus_proyecto/screens/nd3_performance.dart';
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

 

  int selectedND = 0; // 0: Todos, 1: ND1, 2: ND2, 3: ND3

  Color colorND1 = const Color(0xFFFD6A6A);
  Color colorND2 = const Color(0XFFE7E2E2);
  Color colorND3 = const Color(0XFFE7E2E2);

  Color textColorND1 = Colors.white;
  Color textColorND2 = Colors.black;
  Color textColorND3 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      
      body:CustomScrollView(
          slivers: [
            const SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 64,
              backgroundColor:
                  Colors.transparent, // Altura expandida del app bar
              floating:
                  true, 
              pinned:
                  false, 
              flexibleSpace: CustomAppBar(),
            ),
            SliverToBoxAdapter(
          child: Column(
          children: [
            // Encabezado con información del usuario

            // Secciones desplegables para el ciclo y el curso
            Column(
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left:15.0),
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
                SizedBox(height: 10),
                Container(
                  height: 27,
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
                            width: 80,
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
                            width: 85,
                            decoration: BoxDecoration(
                              color: selectedND == 1
                                  ? Color(0xFFFD6A6A)
                                  : Color(0XFFE7E2E2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                "ND1",
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
                            width: 85,
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
                                "ND2",
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedND = 3;
                            });
                          },
                          child: Container(
                            height: 25,
                            width: 85,
                            decoration: BoxDecoration(
                              color: selectedND == 3
                                  ? Color(0xFFFD6A6A)
                                  : Color(0XFFE7E2E2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                "ND3",
                                style: TextStyle(
                                  color: selectedND == 3
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
                  if (selectedND == 1) ND1Performance(),
              if (selectedND == 2) ND2Performance(),
              if (selectedND == 3) ND3Performance(),
              Visibility(
                visible: selectedND != 1 && selectedND != 2 && selectedND != 3,
                child: Column(
                  children: [
                    const MainPerformance(),
                  
/*
                    // Sección para Estudios Generales
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpandedEstudiosGenerales =
                                !isExpandedEstudiosGenerales;
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
                                        "Rendimiento General",
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
     */             ],
                ),
              )
            ]),
          ],
        ),
            ),
          ]
      ),
    );
  }
}

/*

Se subio correctamente al github

*/