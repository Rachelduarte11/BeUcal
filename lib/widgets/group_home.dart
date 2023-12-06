import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/models/colors.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/analisis_datos.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/analisis_inventario.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/asistente.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/rrhh.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/model/model_future_jobs.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/screens/view_task.dart';
import 'package:becertus_proyecto/widgets/dashboard/global/competencias/column_competencias.dart';
import 'package:becertus_proyecto/widgets/dashboard/global/competencias/temperature.dart';
import 'package:becertus_proyecto/widgets/dashboard/competencias_generales.dart/adaptacion.dart';
import 'package:becertus_proyecto/widgets/dashboard/competencias_generales.dart/colaboracion_autentica.dart';
import 'package:becertus_proyecto/widgets/dashboard/competencias_generales.dart/creatividad.dart';
import 'package:becertus_proyecto/widgets/dashboard/global/future_job.dart';
import 'package:becertus_proyecto/widgets/dashboard/competencias_generales.dart/investigacion.dart';
import 'package:becertus_proyecto/widgets/dashboard/competencias_generales.dart/pensamiento.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';


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
                  /*boxShadow: [
                    const BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(1, 3),
                      blurRadius: 3.5,
                    ),
                  ],*/
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
                    /*boxShadow: const [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(1, 3),
                        blurRadius: 3.5,
                      ),
                    ],*/
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const ViewTasks()));
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

class GroupHabilitys extends StatefulWidget {
  GroupHabilitys({super.key});

  @override
  State<GroupHabilitys> createState() => _GroupHabilitysState();
}

class _GroupHabilitysState extends State<GroupHabilitys> {
  int selectedND = 0;
  // 0: Global, 1:apoyo, 2:creatividad,
  Color colorApoyo = const Color(0xFFFD6A6A);
  Color colorCreatividad = const Color.fromARGB(206, 255, 255, 255);
  Color colorAdaptacion = const Color.fromARGB(206, 255, 255, 255);
  Color colorPensamientoCritico = const Color.fromARGB(206, 255, 255, 255);
  Color colorInvestigacion = const Color.fromARGB(206, 255, 255, 255);

  Color textColorApoyo = Colors.white;
  Color textColorCreatividad = Colors.black;
  Color textColorAdaptacion = Colors.black;
  Color textColorPensamientoCritico = Colors.black;
  Color textColorInvestigacion = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          // padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          height: selectedND >0 ? MediaQuery.of(context).size.height * 1.2:MediaQuery.of(context).size.height * 0.88,
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  //padding: EdgeInsets.only(bottom: 10),
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                        image:  selectedND > 0 ? AssetImage('assets/images/main2.png') : AssetImage('assets/images/main.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      const Text('Competencias',
                          style: TextStyle(
                              color: Color(0xff323232),
                              fontFamily: 'Mitr',
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _competencias(),
                          ],
                        ),
                      ),
                      selectedPerformanceWidget(),
                      //_contentCompetenciasGlobal(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: selectedND==0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height * 0.37,
            //padding: EdgeInsets.only(top: 6),
           // margin: EdgeInsets.only(bottom: 8),
            
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text('POSIBLES PUESTOS LABORALES', style: TextStyle(
                    fontFamily: 'Arimo',
                    fontSize: 14,
                    color:Color.fromARGB(255, 31, 30, 30),
                  ),),
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AverageFutureJob(
                        textFutureJob: 'Analista de Inventario y abastecimiento',
                        progressValue: 80, pathImages: 'assets/images/jobs/analista-inventario.png',
                        pageJob: AnalisisInventario(),
                        documentId:'analista de datos' ,
                      ),
                      AverageFutureJob(
                          textFutureJob: 'Asistente de consultorías',
                          progressValue: 50,
                          pathImages: 'assets/images/jobs/asistente.png',
                          pageJob: Asistente(),
                          documentId:'analista de inventario' ,),
                      AverageFutureJob(
                          textFutureJob: 'Analista de datos', progressValue: 30,
                          pathImages: 'assets/images/jobs/analista-datos.png',
                          pageJob: AnalisisDatos(),
                          documentId:'asistente de consultorias'),
                      AverageFutureJob(
                          textFutureJob: 'Especialista en RR.HH',
                          progressValue: 20,
                          pathImages: 'assets/images/jobs/rrhh.png',
                          pageJob: RRHH(),
                          documentId:'rrhh'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _contentCompetenciasGlobal(BuildContext context) {
    String temperature = obtenerEvaluacion(promedioPonderado);
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
                    child: Center(child: CompetenciasColumnChart())),
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
                      competenciasList(colaboracionAutenticaColor,
                          colaboracionAutenticaTitle),
                      competenciasList(creatividadColor, creatividadTitle),
                      competenciasList(adaptacionColor, adaptacionTitle),
                      competenciasList(
                          pensamientoCriticoColor, pensamientoCriticoTitle),
                      competenciasList(investigacionColor, investigacionTitle),
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
                      competenciasList(
                          introProgramacionColor, introProgramacionTitle),
                      competenciasList(
                          quimicaIngenieriaColor, quimicaIngenieriaTitle),
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
                          temperature,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mitr',
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.20,
                            child: Center(child: TuWidget())),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container competenciasList(
      Color colorCompetencia, String variableCompetencia) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.035,
      child: Row(
        children: [
          const SizedBox(width: 4),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: colorCompetencia,
                borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              variableCompetencia,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _competencias() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 0;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 4, left: 1),
              padding: EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(1, 1),
                      blurRadius: 3.5,
                    ),
                  ],
                  color: selectedND == 0
                      ? Color(0xFF0BB49D)
                      : Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                selectedND == 0
                    ? 'assets/images/iconos/global-light.png' // Imagen cuando está en rojo
                    : 'assets/images/iconos/global-dark.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 1;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.5),
              padding: EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 1
                    ? Color(0xFF0BB49D)
                    : Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 1
                    ? 'assets/images/iconos/apoyo-light.png'
                    : 'assets/images/iconos/apoyo-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 2;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.5),
              padding: EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 2
                    ? Color(0xFF0BB49D)
                    : Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 2
                    ? 'assets/images/iconos/bombilla-light.png'
                    : 'assets/images/iconos/bombilla-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 3;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5),
              padding: const EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 3
                    ? Color(0xFF0BB49D)
                    : Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 3
                    ? 'assets/images/iconos/adaptacion-light.png'
                    : 'assets/images/iconos/adaptacion-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 4;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.5),
              padding: EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 4
                    ? Color(0xFF0BB49D)
                    : Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 4
                    ? 'assets/images/iconos/pensamiento-light.png'
                    : 'assets/images/iconos/pensamiento-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 5;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.5),
              padding: EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(62, 26, 25, 25),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 5
                    ? Color(0xFF0BB49D)
                    : Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 5
                    ? 'assets/images/iconos/investigacion-light.png'
                    : 'assets/images/iconos/investigacion-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
           GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 6;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.5),
              padding: EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 6
                    ? Color(0xFF0BB49D)
                    : Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 6
                    ? 'assets/images/iconos/codificacion-light.png'
                    : 'assets/images/iconos/codificacion-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
           GestureDetector(
            onTap: () {
              setState(() {
                selectedND = 7;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3.5),
              padding: EdgeInsets.all(14),
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(1, 1),
                    blurRadius: 3.5,
                  ),
                ],
                color: selectedND == 7
                    ? Color(0xFF0BB49D)
                    : Color.fromARGB(255, 242, 242, 242),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                selectedND == 7
                    ? 'assets/images/iconos/quimica-light.png'
                    : 'assets/images/iconos/quimica-dark.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget selectedPerformanceWidget() {
    switch (selectedND) {
      case 1:
        return const DashboardColaboracion();
      case 2:
        return const DashboardCreatividad();
      case 3:
        return const DashboardAdaptacion();
      case 4:
        return const DashboardPensamientoCritico();
      case 5:
        return const DashboardInvestigacion();
      case 6:
        return const DashboardInvestigacion();
      case 7:
        return const DashboardInvestigacion();
      default:
        return Visibility(
          visible:selectedND ==0,
          child: Column(
            children: [
              _contentCompetenciasGlobal(context),
              
            ],
          ),
        );
    }
  }
}

// Creacion de variables para cada competencia
String colaboracionAutenticaTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Colaboración Auténtica')['title'];
Color colaboracionAutenticaColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Colaboración Auténtica')['color'];

String creatividadTitle = allCompetencias['General']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Creatividad para alcanzar tus metas')['title'];
Color creatividadColor = allCompetencias['General']!.firstWhere((competencia) =>
    competencia['title'] == 'Creatividad para alcanzar tus metas')['color'];

String adaptacionTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Adaptación al entorno')['title'];
Color adaptacionColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Adaptación al entorno')['color'];

String pensamientoCriticoTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Pensamiento crítico')['title'];
Color pensamientoCriticoColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Pensamiento crítico')['color'];

String investigacionTitle = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Investigación')['title'];
Color investigacionColor = allCompetencias['General']!.firstWhere(
    (competencia) => competencia['title'] == 'Investigación')['color'];

String introProgramacionTitle = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Introducción a la Programación')['title'];
Color introProgramacionColor = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Introducción a la Programación')['color'];

String quimicaIngenieriaTitle = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Química para Ingeníeria')['title'];
Color quimicaIngenieriaColor = allCompetencias['Especificas']!.firstWhere(
    (competencia) =>
        competencia['title'] == 'Química para Ingeníeria')['color'];
