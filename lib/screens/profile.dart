import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            //Contenedor superior (Celeste)
            child: Container(
              height: 300,
              color: Color.fromARGB(255, 73, 196, 223),
              child: Stack(
                children: [
                  const Positioned(
                    //Texto (PERFIL)
                    left: 30,
                    top: 45,
                    child: Text(
                      "Perfil",
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Mitr",
                      ),
                    ),
                  ),
                  //Icono (PENCIL)
                  Positioned(
                    bottom: 100,
                    left: 220,
                    child: Image.asset(
                      'assets/images/lapiz.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Contenedor Padre (blanco)
          Transform.translate(
            offset: const Offset(
                0, -190), // Ajusta la posición vertical del segundo contenedor
            child: Stack(
              children: [
                Container(
                  width: 330,
                  height: 340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //Bordes del contenedor
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 161, 161, 161).withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  //Texto Usuario
                  child: const Center(
                    child: Positioned(
                      child: Text(
                        "Alessandro Miguel Arias Marquina",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                //Contenedor hijo (Gris)
                Positioned(
                  top: 210,
                  left: 15,
                  child: Container(
                      width: 300,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 234, 234),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Transform.translate(
                        offset: const Offset(0, -170),
                        child: Center(
                          child: Container(
                            width: 95, // Aumenta el tamaño del contenedor
                            height: 18, // Aumenta el tamaño del contenedor
                            decoration: BoxDecoration(
                              color: Colors.grey, // Establece el fondo en gris
                              borderRadius: BorderRadius.circular(40), // Radio para el contenedor circular
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "assets/images/StackPath.jpeg",
                                  width: 90, 
                                  height: 180, 
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Medidas base celeste

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h);
    path.quadraticBezierTo(
      w,
      h,
      w * 1,
      h - 70,
    );

    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
