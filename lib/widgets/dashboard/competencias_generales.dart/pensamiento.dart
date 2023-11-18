import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class DashboardPensamientoCritico extends StatelessWidget {
  const DashboardPensamientoCritico({super.key});

  @override
  Widget build(BuildContext context) {
    
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.all(6),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.25,
                    borderRadius: 10,
                    blur: 20,
                    alignment: Alignment.center,
                    border: 0.2,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
                        const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    // child: Center(child: CompetenciasColumnChart())
                  ),
                ],
              ),
              Row(
                children: [
                  GlassmorphicContainer(
                    margin: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.20,
                    borderRadius: 10,
                    blur: 20,
                    alignment: Alignment.center,
                    border: 0.2,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
                        const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 6, top: 4),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'GENERALES',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 212, 212, 212)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5.5,
                  ),
                  GlassmorphicContainer(
                    margin: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.20,
                    borderRadius: 10,
                    blur: 10,
                    alignment: Alignment.center,
                    border: 0.2,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromARGB(255, 32, 32, 32).withOpacity(0.25),
                        const Color.fromARGB(255, 36, 36, 36).withOpacity(0.25),
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: EdgeInsets.only(left: 6, top: 4),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'ESPECIFICAS',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 212, 212, 212)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GlassmorphicContainer(
                      margin: EdgeInsets.only(top: 5),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.27,
                      borderRadius: 10,
                      blur: 20,
                      alignment: Alignment.center,
                      border: 0.2,
                      linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color.fromARGB(255, 32, 32, 32)
                              .withOpacity(0.25),
                          const Color.fromARGB(255, 36, 36, 36)
                              .withOpacity(0.25),
                        ],
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: EdgeInsets.only(left: 6, top: 4),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'TERMÓMETRO DE RENDIMINETO',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 212, 212, 212)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                           ' temperature',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Mitr',
                            ),
                          ),
                       
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      );
  }
}