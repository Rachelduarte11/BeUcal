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
                  child: Text(
                    "Perfil",
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
        Container(
          width: 330,
          height: 100,
          color: const Color.fromARGB(255, 213, 206, 206),
          margin: EdgeInsets.only(top: 10.0),
        ),
      ],
    ),
  );
}}

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
