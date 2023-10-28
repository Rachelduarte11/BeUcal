
import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDFFFB),
      body: Stack(
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
                    Container(
                      margin: EdgeInsets.only(left: 30, bottom: 3),
                      alignment: Alignment.centerLeft,
                      child: CustomText(text: 'Email Institucional', fontSize: 16,),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child:
                            _TextField(context, Icons.person_outline_rounded)),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 30, bottom: 3),
                        alignment: Alignment.centerLeft,
                        child: CustomText(text: 'Contraseña', fontSize: 16)),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: _TextField(context, Icons.lock)),
                       
                  ],
                ),
              ),
               const SizedBox(
                height: 6,
              ),
               const CustomText(text: '¿Olvidaste tu contraseña?', fontSize: 14),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff39373E), // Color de fondo del botón
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20)) // Color del texto en el botón
                    ),
                child: GestureDetector(
                  onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomeScreen()),
                          );
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
    );
  }

  Container _TextField(BuildContext context, IconData myIcon) {
    
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                Colors.grey.withOpacity(0.5), // Color y opacidad de la sombra
            spreadRadius: 3, // Cuánto se extiende la sombra
            blurRadius: 5, // Difuminado de la sombra
            offset: Offset(0, 2),
          )
        ],
      ),
      //width: MediaQuery.of(context).size.width *0.85,
      child: Row(
        children: [
          Icon(
            myIcon,
            size: 32,
            color: Color(0xff39373E),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.white), // Bordes cuando está enfocado
                ),
            
              ),
              style: TextStyle(color: Color(0xff39373E))
            ),
          ),
        ],
      ),
    );
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
