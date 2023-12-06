import 'dart:async';
import 'dart:ffi';
import 'package:becertus_proyecto/screens/home_teacher.dart';
import 'package:page_transition/page_transition.dart';
import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<bool> isSelected = [true, false];

Future<String?> obtenerIdEstudiante(String email, String password) async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("estudiantes")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .get();

    if (querySnapshot.size == 1) {
      // Si se encuentra un estudiante con las credenciales proporcionadas
      String studentId = querySnapshot.docs[0].id;

      return studentId;
    } else {
      // Si no se encuentra ningún estudiante con las credenciales proporcionadas
      return null;
    }
  } catch (e) {
    // Manejar cualquier error que pueda ocurrir durante la consulta
    print("Error al obtener ID del estudiante: $e");
    return null;
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDFFFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 245,
                        height: 255,
                        //alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/elements/Group 32.png',
                          height: 200,
                          width: 350,
                        ),
                      )
                      // Sustituye 'assets/image1.png' con la ruta de tu primera imagen
                      ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: 320,
                      height: 273,

                      child: Image.asset(
                        'assets/elements/Group 33.png',
                        height: 280,
                        width: 350,
                      ), // Sustituye 'assets/image2.png' con la ruta de tu segunda imagen
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //bienvenido
                        const Text(
                          '¡Bienvenido!',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'Mitr',
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            height: 1.3199999723,
                            color: Color(0xff161616),
                          ),
                        ),
                        const Text(
                          "Aprende, organiza y mejora",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'Mitr',
                            fontSize: 24,
                            fontWeight: FontWeight.w300,
                            height: 1.3199999332,
                            color: Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: 20),
                        ToggleButtons(
                          borderColor: Colors.grey,
                          fillColor: Color(0xff323232),
                          borderWidth: 2,
                          selectedBorderColor: Color(0xff323232),
                          selectedColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Estudiante'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text('Docente'),
                            ),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < isSelected.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  isSelected[buttonIndex] = true;
                                } else {
                                  isSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          isSelected: isSelected,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 18,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 30, bottom: 3),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  text: 'Email Institucional',
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(0,
                                          1.5), // changes the position of the shadow
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    labelStyle:
                                        TextStyle(color: Color(0xff323232)),
                                    prefix: RichText(
                                      // Utilizando RichText para incluir el Icon y el Text
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.person,
                                              color: Color(0xff323232),
                                            ),
                                          ),
                                          TextSpan(
                                              text:
                                                  ' ' // Agrega espacio entre el Icon y el Text
                                              ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, bottom: 3),
                                  alignment: Alignment.centerLeft,
                                  child: const CustomText(
                                      text: 'Contraseña', fontSize: 16)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(0,
                                          1.5), // changes the position of the shadow
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      labelStyle:
                                          TextStyle(color: Color(0xff323232)),
                                      prefix: RichText(
                                        // Utilizando RichText para incluir el Icon y el Text
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                Icons.lock,
                                                color: Color(0xff323232),
                                              ),
                                            ),
                                            TextSpan(
                                                text:
                                                    ' ' // Agrega espacio entre el Icon y el Text
                                                ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const CustomText(
                                  text: '¿Olvidaste tu contraseña?',
                                  fontSize: 14),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (isSelected[1]) {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: HomeTeacherScreen(),
                                        duration: Duration(milliseconds: 400),
                                      ),
                                    );
                                  } else {
                                    String? studentId =
                                        await obtenerIdEstudiante(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                    bool usuarioEncontrado = false;
                                    NotasProvider notasProvider =
                                        Provider.of<NotasProvider>(context,
                                            listen: false);

                                  if (studentId != null) {
                                    await notasProvider
                                        .obtenerNotasEstudiante(studentId);
                                    await notasProvider
                                        .obtenerDatosEstudiante(studentId);
                                    String? photoUrl = notasProvider.photoUrl;

                                    print(photoUrl);
                                    print(
                                        "Acceso permitido, ID del estudiante: $studentId");
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setBool('isLoggedIn', true);

                                      // Limpia los controladores y navega a HomeScreen
                                      emailController.clear();
                                      passwordController.clear();
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: HomeScreen(),
                                          duration: Duration(milliseconds: 400),
                                        ),
                                      );
                                      emailController.clear();
                                      passwordController.clear();
                                    } else if (!usuarioEncontrado) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Error',
                                              style: TextStyle(
                                                color: Colors
                                                    .black, // Cambiar a negro o a otro color más oscuro según el diseño
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: Text(
                                              'Credenciales inválidas',
                                              style: TextStyle(
                                                color: Colors
                                                    .black, // Cambiar a negro o a otro color más oscuro según el diseño
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cerrar'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color(
                                        0xff39373E), // Color de fondo del botón
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20)) // Color del texto en el botón
                                    ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Ingresar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mitr',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _TextField(
    BuildContext context,
    IconData myIcon,
  ) {
    return TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide:
                BorderSide(color: Colors.white), // Bordes cuando está enfocado
          ),
        ),
        style: TextStyle(color: Color.fromARGB(13, 57, 55, 62)));
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomText({required this.text, required this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Mitr', fontSize: fontSize, color: Color(0xff39373E)),
      textAlign: TextAlign.start,
    );
  }
}
