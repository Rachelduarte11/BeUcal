import 'package:becertus_proyecto/componentes/my_textfield.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        
        
        child: Center(
          
          
          child: Column(
            
        children: [
          SizedBox(height: 50,),
          
          //logo
          
          Icon(
            
            Icons.lock,
            size: 100,
          ),
          const SizedBox(height: 50,),

          //bienvenido
          Text(
            '¡Bienvenido!',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: 'Mitr',
              fontSize: 55,
              fontWeight: FontWeight.w500,
              height: 1.3199999723,
              color: Color(0xff161616),

            ),
          ),
          Text(
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



          const SizedBox(height: 25,),

          //username textfield
          MyTextfield(),

          const SizedBox(height: 20,),

          //password textfield
          MyTextfield(),

          const SizedBox(height: 25,),
          

        ],
      ),
    ),
    
      ),
    );
  }
}


   //class LoginScreen extends StatelessWidget {
  //const LoginScreen({super.key});

  

  /*@override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfffcfcfc),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroup4vexQ4F (8wmM6PyL6D2i9WFoPj4VEX)
              width: 452,
              height: 405,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle22Lib (1:212)
                    left: 0,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 430,
                        height: 340,
                        child: Image.asset(
                         'assets/elements/LOGOTIPO BECERTUS.png',
                          width: 430,
                          height: 340,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    // group214Ph (180:6)
                    child: Container(
                      width: 342,
                      height: 128,
                      child: Stack(
                        children: [
                          Positioned(
                            // bienvenidonab (1:226)
                            left: 0,
                            top: 0,
                            child: Center(
                              child: SizedBox(
                                width: 342,
                                height: 73,
                                child: Text(
                                  '¡Bienvenido! ',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Mitr',
                                    fontSize: 55,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3199999723,
                                    color: Color(0xff161616),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // aprendeorganizaymejoraraT (1:229)
                            left: 39.5,
                            top: 64,
                            child: Align(
                              child: SizedBox(
                                width: 241,
                                height: 64,
                                child: Text(
                                  'Aprende, organiza y mejora',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Mitr',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300,
                                    height: 1.3199999332,
                                    color: Color(0xff000000),
                                  ),
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
          ],
        ),
      ),
    );

    
    
  }*/

  
