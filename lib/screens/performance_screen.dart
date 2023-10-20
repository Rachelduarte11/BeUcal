import 'package:flutter/material.dart';

class MyPerformance extends StatelessWidget {
  const MyPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: 400,
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  //borde a un único lado
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ]),
              child: Column(
                children: [
                  Row(children: [
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
                    const SizedBox(width: 100),
                    //Separación de 2 container texto + imagen
                    Container(
                      margin: const EdgeInsets.only(top: 35),
                      width: 90,
                      height: 100,
                      decoration: BoxDecoration(
                        //shape: hace la forma circular
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 4,
                        ),
                        //Una forma para fácil para poner la imagen circular
                        image: const DecorationImage(
                          image: AssetImage("assets/images/StackPath.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ]),
                  //Conjunto de filas + contenedor envolvente
                  Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //primer contenedor (Número decimal)
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
                        // ND1
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
                        // ND2
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
                        // ND3
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
                                  fontFamily: "Mitr"),
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
<<<<<<< Updated upstream
                SizedBox(
                  height: 210,
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
                    //Icono
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
                // Agregar más contenido aquí si es necesario
              ],
            ),
            
          ),
          Positioned(
            top: 250,
            left: 12,
            child: Center(
              child: Container(
                width: 370,
                height: 330,
                 decoration: const BoxDecoration(
                  color: Colors.white,
                  //borde a un único lado
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      )
                    ], 
                  ),
                  child: Image.asset("assets/images/tabla.png"
                )
              ),
            )
=======
              SizedBox (
                height: 210,
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
                    )
                  ),
                  //Icono
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
                    )
                  ),
                   Icon(
                    Icons.keyboard_arrow_down_sharp,
                  ),
                ],
              ),
              // Agregar más contenido aquí si es necesario
            ],
          ),
>>>>>>> Stashed changes
          )
         
        ],
      ),
    );
  }
}
