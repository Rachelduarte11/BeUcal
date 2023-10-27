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
            // Encabezado con información del usuario
            Container(
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
                  // Información del usuario
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
                              "Alessandro",
                              style: TextStyle(
                                fontSize: 33,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Mitr",
                              ),
                            ),
                            Text(
                              "Futbolista",
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
                      SizedBox(width: 90),
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
                            image: const AssetImage("assets/images/StackPath.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Datos numéricos del usuario
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
            // Secciones desplegables para el ciclo y el curso
            const Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  SizedBox(height: 10),
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
