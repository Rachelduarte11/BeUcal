import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/Students/jobs/model/competences_maps.dart';
import 'package:becertus_proyecto/Students/jobs/widgets/Graphics/graphics_and_maps.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:becertus_proyecto/Students/screens/calendar.dart';
import 'package:becertus_proyecto/Students/screens/home.dart';
import 'package:becertus_proyecto/Students/screens/performance_screen.dart';
import 'package:becertus_proyecto/Students/screens/profile.dart';
import 'package:becertus_proyecto/Students/dashboard/global/range_jobs.dart';
import 'package:becertus_proyecto/Students/jobs/widgets/Graphics/counter_way.dart';
import 'package:becertus_proyecto/Students/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class AnalisisDatos extends StatefulWidget {
  const AnalisisDatos({super.key});

  @override
  State<AnalisisDatos> createState() => _AnalisisDatosState();
}

class _AnalisisDatosState extends State<AnalisisDatos> {
  bool contenedorVisible1 = true;
  bool contenedorVisible2 = true;
  final List<Widget> screens = [
    const HomePage(),
    const MyPerformance(),
     Calendar(),
    const MyProfile(),
  ];

  int currentIndex = 5;

  void onTab(int index) {
    if (index == 0) {
      Navigator.of(context).pop(); // Regresar a HomePage
    } else {
      setState(() {
        currentIndex = index; // Ajustar índice para la nueva lista
      });
    }
  }

  int selectedIndex = 0; 
 String textFutureJob = getTextFutureJobFromJobList(2); // Obtener el valor de textFutureJob para el índice 2

  Color colorND1 = const Color(0xFFFD6A6A);
  Color colorND2 = const Color(0XFFE7E2E2);
  Color textColorND1 = Colors.white;
  Color textColorND2 = Colors.black;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: const Color(0xFFE8F8F7),
      // drawer: MyDrawer(),
      bottomNavigationBar: CustomeNavigationBar(onTab),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {
              // Acción al presionar el botón de retroceso
              Navigator.pop(context);
            },
          ),
          title: Text(
            textFutureJob,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff12B19C),
          elevation: 0,
          expandedHeight: 40, // Altura expandida de la SliverAppBar
          floating:
              true, // La AppBar no se desvanece cuando se hace scroll hacia abajo
          pinned:
              true, // La AppBar permanece fija cuando se hace scroll hacia arriba
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
          child: Container(
            // Tu contenido aquí
            height: MediaQuery.of(context).size.height*1.1 ,
           

            
              child: Container(
                //alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: selectedIndex==1 ? MediaQuery.of(context).size.height * 1.5:
                MediaQuery.of(context).size.height*1.2 ,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff12B19C),
                      const Color.fromARGB(255, 127, 205, 247).withOpacity(0.6),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: const Text(
                          'Competencias para este puesto laboral',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'Arimo',
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      DonutChartGen(),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: greyLight, width: 0.5),
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedIndex == 0
                                        ? const Color.fromARGB(238, 238, 238, 238)
                                        : Colors.transparent),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text('Todos',
                                    style: TextStyle(
                                        color: selectedIndex == 0
                                            ? const Color(0xff0BB49D)
                                            : const Color(0XFFE7E2E2))),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: greyLight, width: 0.5),
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedIndex == 1
                                        ? const Color.fromARGB(238, 238, 238, 238)
                                        : Colors.transparent),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                child: Text('Detalles',
                                    style: TextStyle(
                                        color: selectedIndex == 1
                                            ? const Color(0xff0BB49D)
                                            : const Color(0XFFE7E2E2))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (selectedIndex == 1) const DetailsButton(selectedIndex: 0,),
                      Visibility(
                        visible: selectedIndex != 1,
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _leyendaAbilitys(context),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                        width: MediaQuery.of(context).size.width * 0.95,
                                        height: MediaQuery.of(context).size.height * 0.25,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: const Color(0XFFF5F5F5),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromARGB(62, 133, 132, 132),
                                                offset: Offset(1, 1),
                                                blurRadius: 3.5,
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(30)),
                                    child: const MovingAvatar(jobInfoIndex: 2, )),
                                ),
                                
                                noDevelopmentAbilitys(context)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      //  ),
    );
  }

  Center noDevelopmentAbilitys(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: const Color(0XFFF5F5F5),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(62, 133, 132, 132),
                offset: Offset(1, 1),
                blurRadius: 3.5,
              ),
            ],
            borderRadius: BorderRadius.circular(30)),
        child: Column(children: [
          const Text(
            'Competencias que faltan desarrollar',
            style: TextStyle(
                color: Color(0xff323232),
                fontFamily: 'Arimo',
                fontWeight: FontWeight.w500),
          ),
          competenciasDesarrollar(
            context,
            'Para mejorar esta competencia, te hace falta avanzar en Enfoque Teórico y Análisis de Datos',
            10,
            ColorConstants.color1,
            'Investigacion',
            contenedorVisible1,
            () {
              setState(() {
                contenedorVisible1 = !contenedorVisible1;
              });
            },
          ),
          competenciasDesarrollar(
            context,
            'Para desarrollar esta competencia te hace falta mejorar la Comunicación efectiva',
            10,
            ColorConstants.color2,
            'Colaboración Autentica',
            contenedorVisible2,
            () {
              setState(() {
                contenedorVisible2 = !contenedorVisible2;
              });
            },
          )
        ]),
      ),
    );
  }

  Container _leyendaAbilitys(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.09,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(62, 133, 132, 132),
              offset: Offset(1, 1),
              blurRadius: 3.5,
            ),
          ],
          color: Color(0XFFF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: ClipRRect(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Wrap(
              spacing: 4.0, // Espaciado horizontal entre los elementos
              runSpacing: 4.0,
              children: CircleAndText.generateCircleAndTextWidgets(),
             
            ),
          ),
        ),
      ),
    );
  }

  Widget competenciasDesarrollar(
    BuildContext context,
    String capacidadesText,
    double value,
    Color color1,
    String competencia,
    bool isVisible,
    VoidCallback onPressed,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: greyLight, style: BorderStyle.solid)),
      child: Row(children: [
        Visibility(
          visible: isVisible,
          child: Row(
            children: [
              ProgressBarRange(value, color1, color1),
              const SizedBox(width: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'COMPETENCIA',
                      style: TextStyle(color: Color(0xff323232), fontSize: 10),
                    ),
                    AutoSizeText(
                      competencia,
                      style: const TextStyle(
                          fontFamily: 'Mitr',
                          color: Color(0xff323232),
                          fontSize: 18,
                          height: 1),
                      maxLines: 2,
                      minFontSize: 12.0, // Tamaño mínimo de la fuente
                      maxFontSize: 24.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: !isVisible,
          child: Row(
            children: [
              ProgressBarRange(value, color1, color1),
              const SizedBox(width: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CAPACIDADES',
                      style: TextStyle(color: Color(0xff323232), fontSize: 10),
                    ),
                    AutoSizeText(
                      capacidadesText,
                      style: const TextStyle(
                          fontFamily: 'Arimo',
                          color: Color(0xff323232),
                          fontSize: 12,
                          height: 1),
                      maxLines: 4,
                      minFontSize: 10.0, // Tamaño mínimo de la fuente
                      maxFontSize: 18.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // SizedBox(width: 5,),
        arrowContainerVisible(isVisible, onPressed),
      ]),
    );
  }

  IconButton arrowContainerVisible(bool isVisible, VoidCallback onPressed) {
    return IconButton(
        icon: Icon(
          isVisible
              ? Icons.arrow_forward_ios_outlined
              : Icons.arrow_back_ios_outlined,
          size: 18,
          color: const Color(0xff323232),
        ),
        onPressed: onPressed);
  }
}


