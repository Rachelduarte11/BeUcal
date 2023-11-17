import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/view_task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Graphics/charts.dart';

class GroupMain extends StatelessWidget {
  GroupMain({super.key});

  @override
  Widget build(BuildContext context) {
    final notasProvider = Provider.of<NotasProvider>(context);
   double? ED = notasProvider.ED;
double? FP = notasProvider.FP;
double? EG = notasProvider.EG;
        if (ED == null) {
          ED = 0.0; // Asigna un valor predeterminado si ED es nulo
        }

        if (FP == null) {
          FP = 0.0; // Asigna un valor predeterminado si FP es nulo
        }

        if (EG == null) {
          EG = 0.0; // Asigna un valor predeterminado si EG es nulo
        }
    final average = (ED + FP + EG)/3;
    String averageString = average.toStringAsFixed(2);
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 8, 2),
      width: double.infinity,
      height: 244,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // group2iPh (1:71)
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(20.23, 15, 22.26, 19),
                width: 188.48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const RadialGradient(
                    center: Alignment(0, -0),
                    radius: 0.5,
                    colors: <Color>[
                      Color.fromARGB(155, 239, 145, 14),
                      Color(0xffF79521)
                    ],
                    stops: <double>[0, 0.984],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(1, 3),
                      blurRadius: 3.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(21.4, 0, 22.37, 1.08),
                      padding: EdgeInsets.fromLTRB(18.53, 0, 15.56, 4.37),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: greyOpa,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 128.13,
                          height: 106.88,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/fire-shadow.png', // Ruta de la imagen con sombra
                                fit: BoxFit.cover,
                                height: 130,
                                width: 120,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 4, 0, 7.54),
                      child:  Text(
                        averageString,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Mitr',
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                          height: 0.9299999584,
                          color: Color(0xffe2e2e2),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(2.84, 0, 0, 0),
                      constraints: const BoxConstraints(
                        maxWidth: 110,
                      ),
                      child: const Text(
                        'Promedio General',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Mitr',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          height: 0.9299999237,
                          color: Color(0xffe2e2e2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //recursos
          Container(
            width: 160,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(1, 0, 1, 11.3),
                  padding: const EdgeInsets.fromLTRB(35, 8, 24, 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffC9D32B),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(1, 3),
                        blurRadius: 3.5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(6, 0, 19, 3),
                        width: double.infinity,
                        height: 60,
                        child: Stack(
                          children: [
                            Positioned(
                              // ellipse18w5R (186:7)
                              left: 2,
                              top: 0,
                              child: Align(
                                child: SizedBox(
                                  width: 64,
                                  height: 60,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          greyOpa2, // Color de fondo circular
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // piladelibrosicono3deducacinyco (1:123)
                              left: 0,
                              top: 8,
                              child: Align(
                                child: SizedBox(
                                  width: 70,
                                  height: 40,
                                  child: Image.asset(
                                    'assets/images/recursos1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Recursos
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: 97,
                        ),
                        child: Text(
                          'Recursos digitales',
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            height: 1.1,
                            color: Color(0xfffafafa),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Horario
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => ViewTasks()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 1, 0),
                    padding: EdgeInsets.fromLTRB(35, 8, 28, 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffC9D32B),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(1, 3),
                          blurRadius: 3.5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 19, 0),
                          width: double.infinity,
                          height: 66,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 2,
                                child: Center(
                                  child: SizedBox(
                                    width: 64,
                                    height: 60,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            greyOpa2, // Color de fondo circular
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.asset(
                                      'assets/images/calendario.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 100,
                          ),
                          // logrostaK (1:87)

                          child: Text(
                            'Horario',
                            style: TextStyle(
                              fontFamily: 'Mitr',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: Color(0xfffafafa),
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
    );
  }
}

class GroupHabilitys extends StatelessWidget {
  const GroupHabilitys({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      child: Stack(
        children: [
          Align(
            child: SizedBox(
              width: 84,
              height: 80,
              child: Container(
                width: 204,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyOpa, // Color de fondo circular
                ),
              ),
            ),
          ),
          Center(
            child: Align(
              child: SizedBox(
                width: 360,
                height: 115,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: const Color(0xef0BB49D),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(1, 3),
                        blurRadius: 3.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 24),
            alignment: Alignment.centerRight,
            child: SizedBox(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color.fromARGB(255, 235, 235, 235),
                size: 32,
              ),
            ),
          ),
          const Positioned(
            // tushabilidades9YB (1:121)
            left: 107,
            top: 30,
            child: Align(
              child: SizedBox(
                width: 186,
                height: 32,
                child: Text(
                  'Tus Habilidades',
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1.3199999332,
                    color: Color(0xfffafafa),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // ellipse6rhV (1:80)
            left: 21,
            top: 26,
            child: Align(
              child: SizedBox(
                width: 80,
                height: 90,
                child: Container(
                  margin: EdgeInsets.only(left: 3),
                  padding: EdgeInsets.fromLTRB(20.53, 0, 15.56, 7.37),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: greyOpa, // Color de fondo circular
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // premiumpsdrocket3diconillustra (1:79)
            left: 22,
            top: 28,
            child: Align(
              child: SizedBox(
                width: 80,
                height: 91,
                child: Image.asset(
                  'assets/images/cohete.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            // miralashabilidadesquehasobteni (1:122)
            left: 112,
            top: 66,
            child: Align(
              child: SizedBox(
                width: 212,
                height: 40,
                child: Text(
                  'Mira las habilidades que has obtenido en este recorrido',
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.3199999491,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
