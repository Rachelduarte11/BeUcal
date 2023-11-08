import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // String email_input = '';
  // String password_input = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // No es necesario inicializar los controladores aquí porque ya comienzan con texto vacío
    _checkSession(); // Llama a la función para verificar la sesión al iniciar la app
  }

  void _checkSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isSessionValid = prefs.getBool('session');
    if (isSessionValid != null && isSessionValid) {
      // Si hay una sesión válida, navega al HomeScreen directamente
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    // Limpia los controladores cuando el estado se destruya
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDFFFB),
      body: ListView(
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

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 30, bottom: 3),
                                alignment: Alignment.centerLeft,
                                child: const CustomText(
                                  text: 'Email Institucional',
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
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
                              const SizedBox(height: 10),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 30, bottom: 3),
                              alignment: Alignment.centerLeft,
                              child: const CustomText(
                                  text: 'Contraseña', fontSize: 16)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.black),
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const CustomText(
                        text: '¿Olvidaste tu contraseña?', fontSize: 14),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        bool usuarioEncontrado =
                            false; // Asumimos que el usuario no se ha encontrado

                        // Obtén los documentos una vez
                        var estudiantesCollection = await FirebaseFirestore
                            .instance
                            .collection("estudiantes")
                            .get();

                        // Revisa cada documento para ver si las credenciales coinciden
                        for (var element in estudiantesCollection.docs) {
                          String email = element.data()['email'];
                          String password = element.data()['password'];
                          if (emailController.text == email &&
                              passwordController.text == password) {
                            usuarioEncontrado = true;
                            print('acceso permitido');
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('session', true);

                            // Establece un temporizador para limpiar la sesión después de 1 minuto
                            Timer(Duration(minutes: 1), () async {
                              await prefs.setBool('session', false);
                            });

                            // Limpia los controladores y navega a HomeScreen
                            emailController.clear();
                            passwordController.clear();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                            emailController.clear();
                            passwordController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => HomeScreen()),
                            );
                            break; // Si encontramos al usuario, no necesitamos seguir buscando
                          }
                        }
                        // Si después de revisar todos, no encontramos al usuario, mostramos la alerta
                        if (!usuarioEncontrado) {
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
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff39373E), // Color de fondo del botón
                        onPrimary: Colors.white, // Color del texto en el botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _TextField(
    BuildContext context,
    IconData myIcon,
  ) {
    return TextFormField(
        obscureText: true,
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
