import 'package:becertus_proyecto/screens/Started/screen_2.dart';
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
                    decoration: BoxDecoration(
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
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 112, 33),
                ),
                child: Align(
                    child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        //width: 240,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topCenter,
                          child: Text(
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
                      const SizedBox(
                        width: 300,
                        child: Text(
                          'Lorem ipsum dolo sit amet, consectetur adipiscing elit. Nullam non ante nec quam sodales venenatis',
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
                              width: 48,
                              height: 48,
                              child: ButtonTheme(
                                  child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 30,
                              )),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
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
