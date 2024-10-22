import 'package:becertus_proyecto/Students/screens/Started/screen_2.dart';
import 'package:flutter/material.dart';

class OneScreen extends StatelessWidget {
  const OneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(children: [
              Align(
                child: SizedBox(
                  height: 480,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          child: Image.asset(
                            'assets/images/start/screen1.png',
                            height: 480,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'assets/images/start/man.png',
                            height: 440,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 247, 112, 33),
                ),
                child: Align(
                    child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                      )),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.topCenter,
                        child: const Text(
                          '¡Te damos la Bienvenida!',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            height: 1.2,
                            fontFamily: 'Mitr',
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff323232),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 7,),
                      const SizedBox(
                        width: 300,
                        child: Text(
                          'BeUcal es la herramienta perfecta para el seguimiento del rendimiento académico, mejora tu seguimiento académico, visualiza tu progreso  y mantén un control detallado de tus notas.',
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff323232),
                            decoration: TextDecoration.none,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                     onTap: () {
                      Navigator.push(
                      context,
                     MaterialPageRoute(builder: (builder) => SecondScreen()),
              );
            },
                        child: Container(
                           margin: const EdgeInsets.only(top: 5),
                          // ignore: sort_child_properties_last
                          child: ClipOval(
                            child: Container(
                             
                              decoration: const BoxDecoration(
                                gradient: RadialGradient(
                                  colors: <Color>[
                                    Color(0xffEB078D),
                                    Color(0xff882887)
                                  ],
                                  center: Alignment(0, -0),
                                  radius: 0.8,
                                ),
                              ),
                              width: 45,
                              height: 45,
                              child: ButtonTheme(
                                  child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 30,
                              )),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                        BoxShadow(
                          color: Color(0xffEB078D),
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                          blurRadius: 5.5,
                        ),
                                          ],
                          ),
                          
                        ),
                      ),
                      ],
                  ),
                )),
              ),
              Container()
            ]),
          ],
        ));
  }
}
