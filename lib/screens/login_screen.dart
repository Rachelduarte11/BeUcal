import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email_input = '';
  String password_input = '';
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
                                  
                                  onChanged: (value) {
                                    setState(() {
                                      email_input = value;
                                      print(email_input);
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    labelStyle:
                                        TextStyle(color: Color(0xff323232)),
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
                                onChanged: (value) {
                                  setState(() {
                                    password_input = value;
                                    //print(email_input);
                                  });
                                },
                                decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                  color: Color(0xff323232),
                                )),
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
                        await FirebaseFirestore.instance
                            .collection("estudiantes")
                            .get()
                            .then((value) {
                          value.docs.forEach((element) {
                            //String nombre = element['nombre'];
                            String email = element['email'];
                            String password = element['password'];
                            if (email_input == email &&
                                password_input == password) {
                              print('acceso permitido');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => HomeScreen()),
                              );
                            }
                          });
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary:
                              Color(0xff39373E), // Color de fondo del botón
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20)) // Color del texto en el botón
                          ),
                      child: GestureDetector(
                        onTap: () async {
                          // AÑADIR USUARIOS A FIREBASE
                          //  await FirebaseFirestore.instance.collection('estudiantes').add({
                          //   'nombre': "Alessandro Marquina",
                          //   'email': "alessandro@gmail.com",
                          //   'password': "1234",

                          // }).then((value){
                          //   print(value.id);
                          // });
                          //FIN DE AÑADIR USUARIOS

                          // FireBase StoreCloud Conexion
                          await FirebaseFirestore.instance
                              .collection("estudiantes")
                              .get()
                              .then((value) {
                            value.docs.forEach((element) {
                              //String nombre = element['nombre'];
                              String email = element['email'];
                              String password = element['password'];
                              if (email_input == email &&
                                  password_input == password) {
                                print('acceso permitido');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => HomeScreen()),
                                );
                              }
                            });
                          });
                        },
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
                      ), // Texto que se muestra en el botón
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
