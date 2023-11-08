import 'package:becertus_proyecto/screens/profile.dart';
import 'package:flutter/material.dart';

class ConfigProfile extends StatelessWidget {
  const ConfigProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDFFFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // LLamando a widgets
            ClipPathBackground2(),
            Transform.translate(
              offset: const Offset(
                  0, -190), // Ajusta este valor para mover la imagen más abajo
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 230,
                  width: 320,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 161, 161, 161),
                        blurRadius: 15,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: SizedBox(
                            width: 124,
                            height: 124,
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 4),
                                shape: BoxShape.circle,
                              ),
                              child: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage: AssetImage(
                                  'assets/images/StackPath.jpeg',
                                ),
                                radius: 60,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      const Text(
                        "Carlos Paz Obada",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0.0, -180),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 210,
                      ),
                      child: const Text(
                        "GENERAL",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Mitr",
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 320,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsetsDirectional.zero,
                      child: Transform.translate(
                        offset: const Offset(20.0, 0.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 197, 239, 230),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                            ),
                            SizedBox(width: 8),
                            const Text(
                              "Correo electronico",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Mitr",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: 320,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsetsDirectional.zero,
                      child: Transform.translate(
                        offset: const Offset(20.0, 0.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 197, 239, 230),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Fecha de nacimiento",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Mitr",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 7), // Espacio entre los contenedores
                    Container(
                      width: 320,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsetsDirectional.zero,
                      child: Transform.translate(
                        offset: const Offset(20.0, 0.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 197, 239, 230),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Carrera",
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Mitr",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: 320,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsetsDirectional.zero,
                      child: GestureDetector(
                        onTap: () {
                          //funcion presionar
                        },
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 197, 239, 230),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Redes Sociales",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Mitr",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      width: 320,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      padding: EdgeInsetsDirectional.zero,
                      child: GestureDetector(
                        onTap: () {
                          //funcion presionar
                        },
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 197, 239, 230),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Número de Emergencia",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Mitr",
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
