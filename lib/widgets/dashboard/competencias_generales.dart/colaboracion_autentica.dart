import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/widgets/dashboard/competencias_generales.dart/bar_grafic.dart';
import 'package:becertus_proyecto/widgets/dashboard/global/competencias/temperature.dart';
import 'package:becertus_proyecto/widgets/dashboard/global/future_job.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class DashboardColaboracion extends StatelessWidget {
  const DashboardColaboracion({super.key});

  @override
  Widget build(BuildContext context) {
   
      return Container(
        height: MediaQuery.of(context).size.height*0.78,
        padding: const EdgeInsets.all(6),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.42,
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
                            'CAPACIDADES',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 212, 212, 212)),
                          ),
                        ),
                        BarTrackerSimplified()
                      ],
                    ),
                  ),
                ],
              ),
          
              _definitionsCan(context),
              _definitionsCan(context),
             
            
            ],
          ),
        ),
      );
    }

  Widget _definitionsCan(BuildContext context) {
    return Row(
              children: [
                GlassmorphicContainer(
                    margin: EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.11,
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
                            'ITEM 1',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 212, 212, 212)),
                          ),
                        ),
                        const SizedBox(
                          height:2,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(3),
                              width: MediaQuery.of(context).size.width * 0.68,
                              child: Text(' Capacidad de expresar las ideas de manera clara y coherente.',
                              style: TextStyle(fontSize: 11),),
                            ),
                      Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFC9D32B),
                        Color.fromARGB(201, 100, 219, 112),
                      ],
                      stops: [0.0, 20],
                    )),
                child: Center(
                  child: AutoSizeText(
                    '20%',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    minFontSize: 12, // Tamaño de fuente mínimo
                    maxFontSize: 20, // Tamaño de fuente máximo
                    presetFontSizes: [20, 16, 14, 12],
                  ),
                ),
              )
                          ],

                        ),
                        
                     
                      ],
                    )),
              ],
            );
  }
  }
