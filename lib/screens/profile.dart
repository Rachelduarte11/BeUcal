import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: 300,
              color: Color.fromARGB(255, 73, 196, 223),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    top: 45,
                    child: Text("Perfil",
                      style: TextStyle(
                        color: const Color(0xFF323232),
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
            offset: Offset(0, -190), // Ajusta la posición vertical del segundo contenedor
            child: Stack(
              children: [
                Container(
                  width: 330,
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 161, 161, 161).withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Positioned(
                      child: Text("Alessandro Miguel Arias Marquina",
                          style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                //Contenedor hijo
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
                  ),
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
