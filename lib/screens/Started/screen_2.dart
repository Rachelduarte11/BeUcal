import 'package:becertus_proyecto/screens/home.dart';/*
import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:becertus_proyecto/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          child: Image.asset(
                            'assets/images/start/screen2.png',
                            height: 480,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            'assets/images/start/woman.png',
                            height: 410,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xff12B19C),
                ),
                child: Align(
                    child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        //width: 240,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topCenter,
                          child: const Text(
                            '¡Te damos la Bienvenida!',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              height: 1.2,
                              fontFamily: 'Mitr',
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff323232),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: const SizedBox(
                          width: 300,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non ante nec quam sodales venenatis',
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontSize: 20,
                              height: 1.3,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff323232),
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Login()),
                          );
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 5),
                          width: 150,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                               BoxShadow(
                                color: Color(0xff12B19C),
                                offset: Offset(0, 0),
                                spreadRadius: 2,
                                blurRadius: 5.5,
                              ),
                            ],
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: RadialGradient(
                                colors: <Color>[
                                  Color(0xff00667C),
                                  Color(0xff00C1A7)
                                ],
                                center: Alignment(0, -0),
                                radius: 5,
                              ),
                            ),
                            width: 48,
                            height: 48,
                            child: ButtonTheme(
                                child: const Text(
                              'Bienvenido',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Mitr',
                                  decoration: TextDecoration.none),
                              textAlign: TextAlign.center,
                            )),
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
*/