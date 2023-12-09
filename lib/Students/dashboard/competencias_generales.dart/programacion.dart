import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/Students/dashboard/global/graphics/bar_grafic.dart';
import 'package:becertus_proyecto/Students/jobs/model/competences_maps.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class DashboardIntroProgramacion extends StatelessWidget {
  const DashboardIntroProgramacion({super.key});
@override
  Widget build(BuildContext context) {
    String titleAbility = allCompetencias['General']?[5]['title'];
   
      return Container(
        height: MediaQuery.of(context).size.height *0.9,
        padding: const EdgeInsets.all(6),
        child: Center(
          child: Column(
            children: [
              Text(titleAbility, style: TextStyle(fontSize: 16, fontFamily: 'Arimo', color: Color(0xff323232)),textAlign: TextAlign.start,),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.41,
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
          
              _definitionsCan(context, 'ITEM 1', 'Expresa ideas de manera clara y coherente.'),
              _definitionsCan(context, 'ITEM 2', 'Genera diferentes alternativas, ideas y soluciones, considerando múltiples enfoques y perspectivas.'),
              _definitionsCan(context, 'ITEM 3', 'Modifica comportamientos, estrategias o enfoques para lograr respuestas ágiles y eficientes a los cambios y desafíos del entorno considerando las tendencias actuales mostrando habilidad para asumir nuevos retos.'),
              _definitionsCan(context, 'ITEM 4', 'Aplica principios lógicos y matemáticos a problemas reales; comprender conceptos abstractos y reglas de inferencia para analizar argumentos.'),
             
            ],
          ),
        ),
      );
    }

  Widget _definitionsCan(BuildContext context, String titleAbility, String contentAbility) {
    return GlassmorphicContainer(
        margin: const EdgeInsets.only(top: 3),
        width: MediaQuery.of(context).size.width * 0.88,
        height: MediaQuery.of(context).size.height * 0.09,
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
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.72,
              margin: const EdgeInsets.only(left: 6, top: 4),
              alignment: Alignment.topLeft,
              child:  Text(
                titleAbility,
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 212, 212, 212)),
              ),
            ),
            const SizedBox(
              height:2,
            ),
            
                Container(
                  margin: const EdgeInsets.all(3),
                  width: MediaQuery.of(context).size.width * 0.65,
                  child:AutoSizeText(contentAbility,
                  maxLines: 3,
                  style: TextStyle(fontSize: 11),),
                ),
              ]),
          Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFC9D32B),
            Color.fromARGB(201, 100, 219, 112),
          ],
          stops: [0.0, 20],
        )),
    child: const Center(
      child: AutoSizeText(
        '20%',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
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
        ));
  }
  }

