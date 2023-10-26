import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDFFFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              // Contenedor Celeste
              child: Container(
                height: 300,
                color: const Color.fromRGBO(18, 177, 158, 1),
                child: Stack(
                  children: [
                    const Positioned(
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
            Transform.translate(
              offset: const Offset(0, -190),
              child: Stack(
                children: [
                  // Contenedor padre (blanco)
                  Container(
                    width: 330,
                    height: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 161, 161, 161)
                              .withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Transform.translate(
                        offset: const Offset(0, 10),
                        child: const Text(
                          "Alessandro Miguel Arias Marquina",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 210,
                    left: 15,
                    child: Container(
                      // Contenedor gris
                      width: 300,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 234, 234),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Transform.translate(
                        offset: const Offset(0, -170),
                        child: Center(
                          // Contenedor hijo Imagen
                          child: Container(
                            width: 90,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            // Imagen usuario
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "assets/images/StackPath.jpeg",
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 27,
                    left: 30,
                    child: Center(
                      child: ClipRRect(
                        child: Image.asset(
                          "assets/images/iconos-usuario.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0.0,
                  -180), 
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
                    Container(
                      width: 320,
                      height: 60,
                      padding: EdgeInsetsDirectional.zero,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        )
                      ),
                      child: Transform.translate(
                        offset: const Offset(20.0,
                            0.0), 
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color:Color.fromARGB(255, 197, 239, 230),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7)
                                )
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Configuración de perfil",
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
                    const SizedBox (height: 12), 
                    Container(
                      width: 320,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        )
                      ),
                      padding: EdgeInsetsDirectional.zero,
                      child:Transform.translate(
                        offset: const Offset(20.0,
                            0.0), 
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                             decoration: const BoxDecoration(
                                color:Color.fromARGB(255, 197, 239, 230),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7)
                                )
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Configuración de perfil",
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
                    const SizedBox(height: 12), // Espacio entre los contenedores
                    Container(
                      width: 320,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20)
                        )
                      ),
                      padding: EdgeInsetsDirectional.zero,
                      child: Transform.translate(
                        offset: const Offset(20.0, 0.0), 
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color:Color.fromARGB(255, 197, 239, 230),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7)
                                )
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Configuración de perfil",
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
