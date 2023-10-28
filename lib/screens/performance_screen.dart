import 'package:becertus_proyecto/screens/main_performance.dart';
import 'package:becertus_proyecto/widgets/header_section.dart';
import 'package:flutter/material.dart';

class MyPerformance extends StatefulWidget {
  const MyPerformance({Key? key}) : super(key: key);

  @override
  _MyPerformanceState createState() => _MyPerformanceState();
}

class _MyPerformanceState extends State<MyPerformance> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F8F6),
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                          // fontFamily: "Mitr",
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
                
              ],
            ),
          ),
          MainPerformance(),
          /*
              Container(
                width: 370,
                height: 290,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(1, 3),
                      blurRadius: 3.5,
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/tabla.png",
                ),
              ),
              Container(
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
                      color: Color(0x3f000000),
                      offset: Offset(1, 3),
                      blurRadius: 3.5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 25,
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
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 35,
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ),
              Container(
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
                      color: Color(0x3f000000),
                      offset: Offset(1, 3),
                      blurRadius: 3.5,
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
              Container(
                width: 350,
                height: 90,
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
                      color: Color(0x3f000000),
                      offset: Offset(1, 3),
                      blurRadius: 3.5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 25, bottom: 5),
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
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 35,
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              )*/
        ],
      ),
    );
  }
}
