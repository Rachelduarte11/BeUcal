import 'package:becertus_proyecto/Students/jobs/widgets/Graphics/graphics_and_maps.dart';
import 'package:becertus_proyecto/Students/screens/calendar.dart';
import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GroupMain extends StatefulWidget {
  GroupMain({super.key});

  @override
  State<GroupMain> createState() => _GroupMainState();
}

class _GroupMainState extends State<GroupMain> {
   bool showBottomNavBar = true; // Puedes inicializarlo según tus necesidades

  @override
  Widget build(BuildContext context) {
    final notasProvider = Provider.of<NotasProvider>(context);
    double? ED = notasProvider.ED;
    double? FP = notasProvider.FP;
    double? EG = notasProvider.EG;

    
    ED ??= 0.0;

    FP ??= 0.0;

    EG ??= 0.0;
    final average = (ED + FP + EG) / 3;
    String averageString = average.toStringAsFixed(2);

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 210,
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
                padding: const EdgeInsets.fromLTRB(20.23, 15, 22.26, 19),
                width: MediaQuery.of(context).size.width * 0.48,
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
                
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(21.4, 0, 22.37, 1.08),
                      padding: const EdgeInsets.fromLTRB(18.53, 0, 15.56, 4.37),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: greyOpa,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 100,
                          height: 90,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/fire-shadow.png', // Ruta de la imagen con sombra
                                fit: BoxFit.cover,
                                height: 90,
                                width: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 4, 0, 7.54),
                      child: Text(
                        averageString,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Mitr',
                          fontSize: 32,
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
                          fontSize: 20,
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
            width: MediaQuery.of(context).size.width * 0.42,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(1, 0, 1, 10),
                  padding: const EdgeInsets.fromLTRB(30, 8, 24, 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffC9D32B),
                    borderRadius: BorderRadius.circular(20),
                    
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 54,
                        child: Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                width: 54,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: greyOpa2, // Color de fondo circular
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: 60,
                                height: 30,
                                child: Image.asset(
                                  'assets/images/recursos1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Recursos
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        width: MediaQuery.of(context).size.width,
                        constraints: const BoxConstraints(
                          maxWidth: 97,
                        ),
                        child: const Text(
                          'Recursos digitales',
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1,
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
          setState(() {
            showBottomNavBar = !showBottomNavBar;
          });

          // Pasa el estado a la pantalla Calendar y reemplaza la pantalla actual
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (builder) => Calendar(),
            ),
          );
        },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(2, 0, 1, 0),
                    padding: const EdgeInsets.fromLTRB(35, 4, 28, 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffC9D32B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 0, 19, 0),
                          width: double.infinity,
                          height: 66,
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 54,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          greyOpa2, // Color de fondo circular
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
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
                          constraints: const BoxConstraints(
                            maxWidth: 100,
                          ),
                          // logrostaK (1:87)

                          child: const Text(
                            'Horario',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
