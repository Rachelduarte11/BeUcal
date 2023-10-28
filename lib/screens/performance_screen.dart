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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Positioned(
                child: Container(
                  width: 400,
                  height: 190,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
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
                          Container(
                            margin: const EdgeInsets.only(
                              top: 25.0,
                              left: 20.0,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Carlos Paz",
                                  style: TextStyle(
                                    fontSize: 33,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Mitr",
                                  ),
                                ),
                                Text(
                                  "Arquitectura",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Mitr",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 90),
                          Container(
                            margin: const EdgeInsets.only(top: 35),
                            width: 90,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 4,
                              ),
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/StackPath.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 95,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFFD6A6A),
                              ),
                              child: const Center(
                                child: Text(
                                  "16.54",
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Mitr",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: Text(
                                  "ND1",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Mitr",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: Text(
                                  "ND2",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Mitr",
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Center(
                                child: Text(
                                  "ND3",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Mitr",
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
              ),
              //Secciones desplegables para el ciclo y el curso, que son opciones de filtrado
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Ciclo:",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Mitr",
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("II",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF44C2DE),
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
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Mitr",
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("Todos",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF44C2DE),
                              fontFamily: "II",
                              fontWeight: FontWeight.w800,
                            )),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Positioned(
                top: 230,
                left: 12,
                child: Center(
                  child: Container(
                    width: 370,
                    height: 290,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/tabla.png",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Positioned(
                top: isExpandedEnfoque  ? 400 : 500,
                left: 20,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpandedEnfoque  = !isExpandedEnfoque ;
                      });
                    },
                    child: Container(
                      width: 350,
                      height: isExpandedEnfoque  ? 300 : 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 25, top: 10, bottom: 5),
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
                                  isExpandedEnfoque 
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                                iconSize: 35,
                                onPressed: () {
                                  setState(() {
                                    isExpandedEnfoque  = !isExpandedEnfoque ;
                                  });
                                },
                              ),
                            ],
                          ),
                          if (isExpandedEnfoque )
                            Image.asset(
                              'assets/images/estudios_generales_muestra.PNG',
                              width: 200,
                              height: 150,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Positioned(
                top: 614,
                left: 20,
                child: Center(
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 25, bottom: 5),
                          child: Text(
                            "Formación Profesional",
                            style: TextStyle(
                              fontFamily: "Mitr",
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 35,
                          onPressed: () {
                            // Agrega aquí la acción que deseas cuando se haga clic en la flecha hacia abajo.
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Positioned(
                top: 300,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpandedEnfoque  = !isExpandedEnfoque ;
                    });
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 25, top: 10, bottom: 5),
                                child: Text(
                                  "Enfoque estratégico de Diseño Arquitectónico",
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
                                  isExpandedEnfoque  = !isExpandedEnfoque ;
                                });
                              },
                            ),
                          ],
                        ),
                        if (isExpandedEnfoque )
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
            ],
          ),
        ));
  }
}

/*
*/
