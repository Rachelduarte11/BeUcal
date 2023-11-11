import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/screens/config_perfil.dart';
import 'package:becertus_proyecto/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Una vez cerrada la sesión, regresa a la pantalla de inicio de sesión
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()), //Ruta de Login
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      //Mensaje de alerta en terminal por si algun error
      print("Error al cerrar sesión: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
     NotasProvider notasProvider = Provider.of<NotasProvider>(context);
    String name = notasProvider.name ?? '';
    String secondName = notasProvider.secondName ?? '';
    String lastName = notasProvider.lastName ?? '';
    String fullName = name +' '+ secondName +' '+ lastName;
    return Scaffold(
      backgroundColor: Color(0xffEDFFFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPathBackground(),
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
                        child: Text(
                          fullName,
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
                  // Foto de perfils
                  Positioned(
                    top: 210,
                    left: 15,
                    child: Container(
                      width: 300,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 234, 234),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Transform.translate(
                        offset: const Offset(0, -170),
                        child: Center(
                          child: Container(
                            width: 90, // Tamaño del contenedor de la imagen
                            height: 120, // Tamaño del contenedor de la imagen
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  50), // Color del borde/ Forma circular
                              boxShadow: const [
                                BoxShadow(spreadRadius: 4, color: Colors.grey),
                              ],
                            ),
                            child: ClipOval(
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration:  BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        notasProvider.photoUrl ?? '',),
                                    fit: BoxFit.cover,
                                  ),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfigProfile()),
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                  color: Color.fromARGB(255, 197, 239, 230),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                              ),
                              SizedBox(width: 8),
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
                              "Notificaciones",
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
                              "Ayuda y asistencia",
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
                          _signOut(
                              context); // Llamada a la función para cerrar sesión al presionar el contenedor.
                        },
                        child: Transform.translate(
                          offset: const Offset(20.0, 0.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 217, 86, 25),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Cerrar sesión",
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

  Container _containerSettings(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: EdgeInsetsDirectional.zero,
      child: Transform.translate(
        offset: const Offset(20.0, 0.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: Color.fromRGBO(18, 177, 158, 1),
            ),
            SizedBox(width: 8),
            const Text(
              "Configuración de perfil",
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontFamily: "Mitr",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Perfil Fondo Verde

class ClipPathBackground extends StatelessWidget {
  const ClipPathBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
                  fontSize: 36,
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
    );
  }
}

//Configuración del Perfil (Fondo verde)

class ClipPathBackground2 extends StatelessWidget {
  const ClipPathBackground2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
                "Configuración",
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 36,
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
