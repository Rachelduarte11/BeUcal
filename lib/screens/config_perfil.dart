import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigProfile extends StatelessWidget {
  const ConfigProfile({super.key});

  @override
  Widget build(BuildContext context) {
    NotasProvider notasProvider = Provider.of<NotasProvider>(context);
    String name = notasProvider.name ?? '';
    String secondName = notasProvider.secondName ?? '';
    String lastName = notasProvider.lastName ?? '';
    String fullName = name + ' ' + secondName + ' ' + lastName;
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
                      Transform.translate(
                        offset: const Offset(0, 0),
                        child: Container(
                          width: 125,
                          height: 125,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Color del borde gris
                              width: 4.0,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              notasProvider.photoUrl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Center(
                      child: Transform.translate(
                        offset: const Offset(0, 10),
                        child: Text(
                          fullName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                   const SizedBox(height: 10),
                    GestureDetector(
                      /*onTap: () {
                        Navigator.push(
                          context,
                          
                      },*/
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 197, 239, 230),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: EdgeInsetsDirectional.zero,
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.email,
                                size: 27,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8),
                              Text(
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
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      /*onTap: () {
                        Navigator.push(
                          context,
                          
                      },*/
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 197, 239, 230),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: EdgeInsetsDirectional.zero,
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                size: 27,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Fecha de Nacimiento",
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
                    const SizedBox(height: 10),
                    GestureDetector(
                      /*onTap: () {
                        Navigator.push(
                          context,
                          
                      },*/
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 197, 239, 230),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: EdgeInsetsDirectional.zero,
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 27,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Teléfono",
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
                    const SizedBox(height: 10),
                    GestureDetector(
                      /*onTap: () {
                        Navigator.push(
                          context,
                          
                      },*/
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 197, 239, 230),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: EdgeInsetsDirectional.zero,
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.personal_injury_outlined,
                                size: 27,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8),
                              Text(
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
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      /*onTap: () {
                        Navigator.push(
                          context,
                          
                      },*/
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 197, 239, 230),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        padding: EdgeInsetsDirectional.zero,
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.location_history_rounded,
                                size: 27,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8),
                              Text(
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
