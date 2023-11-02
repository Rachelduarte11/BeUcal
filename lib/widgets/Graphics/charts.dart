
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///////////GENERAL//////////////////////////////////////////
// PROMEDIOS GENERALES  DE CADA CURSO
final double proII = (nd1ProII+nd2ProII+nd3ProII)/ 3;
final double creaII = (nd1CreaII+nd2CreaII+nd3CreaII)/3;
final double ctI = (nd1CtI+nd2CtI +nd3CtI)/3;
final double thcaI = (nd1ThcaI+nd2ThcaI+nd3ThcaI)/3;
final double fisica = (nd1Fisica+nd2Fisica+nd3Fisica)/3;
final double englishI = (nd1EnglishI+nd2EnglishI+nd3EnglishI)/3;
//GENERAL POR CATEGORIA
final double VED = (proII + creaII) / 2;
double ED = double.parse(VED.toStringAsFixed(1));

final dynamic VFP = (ctI + thcaI + fisica) / 3;
double FP = double.parse(VFP.toStringAsFixed(1)); 

final dynamic VEG = englishI;
double EG = double.parse(VEG.toStringAsFixed(1)); 

//////////////ND1//////////////////////////////////////////
// PROMEDIOS DE ND1
final double nd1ProII = 20;
final double nd1CreaII = 20;
final double nd1CtI = 18;
final double nd1ThcaI = 13;
final double nd1Fisica = 20;
final double nd1EnglishI = 17;
// Promedio general de "ND1"
final double nd1VED = (nd1ProII + nd1CreaII) / 2;
double nd1ED = double.parse(nd1VED.toStringAsFixed(1));

final double nd1VFP = (nd1CtI + nd1ThcaI + nd1Fisica) / 3;
double nd1FP = double.parse(nd1VFP.toStringAsFixed(1)); 

final double nd1VEG = nd1EnglishI;
double nd1EG = double.parse(nd1VEG.toStringAsFixed(1)); 
//////////////ND2//////////////////////////////////////////
// PROMEDIOS DE ND2
final double nd2ProII = 15;
final double nd2CreaII = 15;
final double nd2CtI = 18;
final double nd2ThcaI = 17;
final double nd2Fisica = 20;
final double nd2EnglishI = 14;

// Promedio general de "ND2"
final double nd2VED = (nd2ProII + nd2CreaII) / 2;
double nd2ED = double.parse(nd2VED.toStringAsFixed(1));

final double nd2VFP = (nd2CtI + nd2ThcaI + nd2Fisica) / 3;
double nd2FP = double.parse(nd2VFP.toStringAsFixed(1)); 

final double nd2VEG = nd2EnglishI;
double nd2EG = double.parse(nd2VEG.toStringAsFixed(1));

//////////////ND3//////////////////////////////////////////
// PROMEDIOS DE ND3
final double nd3ProII = 18;
final double nd3CreaII = 18;
final double nd3CtI = 18;
final double nd3ThcaI = 15;
final double nd3Fisica = 20;
final double nd3EnglishI = 14;

// Promedio general de "ND3"
final double nd3VED = (nd3ProII + nd3CreaII) / 2;
double nd3ED = double.parse(nd3VED.toStringAsFixed(1));

final double nd3VFP = (nd3CtI + nd3ThcaI + nd3Fisica) / 3;
double nd3FP = double.parse(nd3VFP.toStringAsFixed(1));

final double nd3VEG = nd3EnglishI;
double nd3EG = double.parse(nd3VEG.toStringAsFixed(1));
/////////////////////////////////////////////////////////////


class RadiusChartGen extends StatefulWidget {
  RadiusChartGen({super.key});
 // String get promedio => promedioTexto; // Getter para promedioTexto
 String promedioTexto = '';
 
  @override
  State<RadiusChartGen> createState() => _RadiusChartGenState();
}

class _RadiusChartGenState extends State<RadiusChartGen> {
  late List<GDPData> _chartData;
  String promedioTexto = ''; // Declarar la variable aquí
// Getter para promedioTexto
void updateVariable(String newValue) {
    setState(() {
      promedioTexto = newValue;
    });
  }


//Funcion parea sumar el promedio general
  @override
  void initState() {
    _chartData = getChartData();
    final List<GDPData> averageData = [
      GDPData(ED, Color(0xffBBC700)),
      GDPData(FP, Color(0xff00C1A7)),
      GDPData(EG, Color(0xff09806F)),
    ];
    double calcularPromedio(List<GDPData> chartData) {
      if (chartData.isEmpty) {
        return 0.0; }

      double suma = 0.0;
      for (var data in chartData) {
        suma += data.course;
      }

      return suma / chartData.length;
    }

    double promedio = calcularPromedio(averageData);
    promedioTexto = promedio.toStringAsFixed(2); // Asignar el valor aquí

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,//double.infinity, // Ocupa todo el ancho disponible
      height:500, //double.infinity, // Ocupa todo el alto disponible
      child: SfCircularChart(
  
        series: <CircularSeries>[
          RadialBarSeries<GDPData, dynamic>(
            dataSource: _chartData,
            useSeriesColor: true,
            trackOpacity: 0.3,
            innerRadius: '50%',
            xValueMapper: (GDPData data, _) => data.course,
            yValueMapper: (GDPData data, _) => data.course,
            pointColorMapper: (GDPData data, _) => data.color,
            maximumValue: 20,
            trackBorderWidth: 5,
            cornerStyle: CornerStyle.bothCurve,
            dataLabelMapper: (GDPData data, _) => data.course.toString(),
          ),
        ],
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Center(
              child: Text(
                promedioTexto, // Coloca el número que desees
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mitr',
                    color: Color.fromARGB(255, 52, 52, 52),
                    letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
      
    );
    
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
     GDPData(ED, Color(0xffBBC700)),
      GDPData(FP, Color(0xff00C1A7)),
      GDPData(EG, Color(0xff09806F)),
    ];
    return chartData;
  }
   
}

class GDPData {
  GDPData(this.course, this.color);
  final dynamic course;
  // final double gdp;
  final Color color;
}



//CONVERSION A STRINGS 
String proIIString = proII.toStringAsFixed(1);
String creaIIString = creaII.toStringAsFixed(1);
String ctIString = ctI.toStringAsFixed(1);
String thcaIString = thcaI.toStringAsFixed(1);
String fisicaString = fisica.toStringAsFixed(1);
String englishIString = englishI.toStringAsFixed(1);

// PROMEDIOS DE ND1
String string_nd1ProII = nd1ProII.toStringAsFixed(1);
String string_nd1CreaII = nd1CreaII.toStringAsFixed(1);
String string_nd1CtI = nd1CtI.toStringAsFixed(1);
String string_nd1ThcaI = nd1ThcaI.toStringAsFixed(1);
String string_nd1Fisica = nd1Fisica.toStringAsFixed(1);
String string_nd1EnglishI = nd1EnglishI.toStringAsFixed(1);

// PROMEDIOS DE ND2
String string_nd2ProII = nd2ProII.toStringAsFixed(1);
String string_nd2CreaII = nd2CreaII.toStringAsFixed(1);
String string_nd2CtI = nd2CtI.toStringAsFixed(1);
String string_nd2ThcaI = nd2ThcaI.toStringAsFixed(1);
String string_nd2Fisica = nd2Fisica.toStringAsFixed(1);
String string_nd2EnglishI = nd2EnglishI.toStringAsFixed(1);

// PROMEDIOS DE ND3
String string_nd3ProII = nd3ProII.toStringAsFixed(1);
String string_nd3CreaII = nd3CreaII.toStringAsFixed(1);
String string_nd3CtI = nd3CtI.toStringAsFixed(1);
String string_nd3ThcaI = nd3ThcaI.toStringAsFixed(1);
String string_nd3Fisica = nd3Fisica.toStringAsFixed(1);
String string_nd3EnglishI = nd3EnglishI.toStringAsFixed(1);

// Crear un mapa con los nombres de los cursos como claves y los puntajes promedio como valores

/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///////////GENERAL//////////////////////////////////////////

class GlobalVariables {
  static double ED = 18;
  static double FP = 0;
  static double EG = 0;
  // PROMEDIOS GENERALES  DE CADA CURSO

  static double proII = 0;
  static double creaII = 0;
  static double ctI = 0;
  static double thcaI = 0;
  static double fisica = 0;
  static double englishI = 0;

//////////////ND1//////////////////////////////////////////
// PROMEDIOS DE ND1
  static double nd1ProII = 0;
  static double nd1CreaII = 0;
  static double nd1CtI = 0;
  static double nd1ThcaI = 0;
  static double nd1Fisica = 0;
  static double nd1EnglishI = 0;
//////////////ND2//////////////////////////////////////////
// PROMEDIOS DE ND2
  static double nd2ProII = 0;
  static double nd2CreaII = 0;
  static double nd2CtI = 0;
  static double nd2ThcaI = 0;
  static double nd2Fisica = 0;
  static double nd2EnglishI = 0;
//////////////ND3//////////////////////////////////////////
// PROMEDIOS DE ND3
  static double nd3ProII = 0;
  static double nd3CreaII = 0;
  static double nd3CtI = 0;
  static double nd3ThcaI = 0;
  static double nd3Fisica = 0;
  static double nd3EnglishI = 0;
}
/////////////////////////////////////////////////////////////

class RadiusChartGen extends StatefulWidget {
  const RadiusChartGen({super.key});

  @override
  State<RadiusChartGen> createState() => _RadiusChartGenState();
}

class _RadiusChartGenState extends State<RadiusChartGen> {
  late List<GDPData> _chartData;
  String promedioTexto = ''; // Declarar la variable aquí

  @override
  void initState() {
    _chartData = getChartData();
    // Llama a consultarNotas para obtener los datos desde Firestore
    consultarNotas(
        'eGYtAQiyan12554BOG6D'); // Reemplaza 'ID_DEL_ESTUDIANTE' con el ID correcto
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500, //double.infinity, // Ocupa todo el ancho disponible
      height: 500, //double.infinity, // Ocupa todo el alto disponible
      child: SfCircularChart(
        series: <CircularSeries>[
          RadialBarSeries<GDPData, dynamic>(
            dataSource: _chartData,
            useSeriesColor: true,
            trackOpacity: 0.3,
            innerRadius: '50%',
            xValueMapper: (GDPData data, _) => data.course,
            yValueMapper: (GDPData data, _) => data.course,
            pointColorMapper: (GDPData data, _) => data.color,
            maximumValue: 20,
            trackBorderWidth: 5,
            cornerStyle: CornerStyle.bothCurve,
            dataLabelMapper: (GDPData data, _) => data.course.toString(),
          ),
        ],
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Center(
              child: Text(
                promedioTexto, // Coloca el número que desees
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mitr',
                    color: Color.fromARGB(255, 52, 52, 52),
                    letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    List<GDPData> chartData = [
      GDPData(GlobalVariables.ED, Color(0xffBBC700)),
      GDPData(GlobalVariables.FP, Color(0xff00C1A7)),
      GDPData(GlobalVariables.EG, Color(0xff09806F)),
    ];
    return chartData;
  }

  void consultarNotas(String estudianteId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      DocumentSnapshot notasSnapshot = await firestore
          .collection('estudiantes')
          .doc('eGYtAQiyan12554BOG6D')
          .collection('notas')
          .doc('notas_estudiante')
          .get();

      if (notasSnapshot.exists) {
        Map<String, dynamic> notasEstudiante =
            notasSnapshot.data() as Map<String, dynamic>;

        print('Valores originales en GlobalVariables:');
        print('GlobalVariables.nd1ProII: ${GlobalVariables.nd1ProII}');
        print('GlobalVariables.nd1CreaII: ${GlobalVariables.nd1CreaII}');
        GlobalVariables.nd1ProII =
            notasEstudiante['nd1']['nd1ProII'].toDouble();
        GlobalVariables.nd1CreaII =
            notasEstudiante['nd1']['nd1CreaII'].toDouble();
        GlobalVariables.nd1CtI = notasEstudiante['nd1']['nd1CtI'].toDouble();
        GlobalVariables.nd1ThcaI =
            notasEstudiante['nd1']['nd1ThcaI'].toDouble();
        GlobalVariables.nd1Fisica =
            notasEstudiante['nd1']['nd1Fisica'].toDouble();
        GlobalVariables.nd1EnglishI =
            notasEstudiante['nd1']['nd1EnglishI'].toDouble();

        /////ND1/////
        GlobalVariables.nd1ProII =
            notasEstudiante['nd1']['nd1ProII'].toDouble();
        GlobalVariables.nd1CreaII =
            notasEstudiante['nd1']['nd1CreaII'].toDouble();
        GlobalVariables.nd1CtI = notasEstudiante['nd1']['nd1CtI'].toDouble();
        GlobalVariables.nd1ThcaI =
            notasEstudiante['nd1']['nd1ThcaI'].toDouble();
        GlobalVariables.nd1Fisica =
            notasEstudiante['nd1']['nd1Fisica'].toDouble();
        GlobalVariables.nd1EnglishI =
            notasEstudiante['nd1']['nd1EnglishI'].toDouble();
/*
        final double nd1VED =
            (GlobalVariables.nd1ProII + GlobalVariables.nd1CreaII) / 2;
        double nd1ED = double.parse(nd1VED.toStringAsFixed(1));

        final double nd1VFP = (GlobalVariables.nd1CtI +
                GlobalVariables.nd1ThcaI +
                GlobalVariables.nd1Fisica) /
            3;
        double nd1FP = double.parse(nd1VFP.toStringAsFixed(1));

        final double nd1VEG = GlobalVariables.nd1EnglishI;
        double nd1EG = double.parse(nd1VEG.toStringAsFixed(1));*/
        /////ND2/////
        GlobalVariables.nd2ProII =
            notasEstudiante['nd2']['nd2ProII'].toDouble();
        GlobalVariables.nd2CreaII =
            notasEstudiante['nd2']['nd2CreaII'].toDouble();
        GlobalVariables.nd2CtI = notasEstudiante['nd2']['nd2CtI'].toDouble();
        GlobalVariables.nd2ThcaI =
            notasEstudiante['nd2']['nd2ThcaI'].toDouble();
        GlobalVariables.nd2Fisica =
            notasEstudiante['nd2']['nd2Fisica'].toDouble();
        GlobalVariables.nd2EnglishI =
            notasEstudiante['nd2']['nd2EnglishI'].toDouble();
/*
        final double nd2VED =
            (GlobalVariables.nd2ProII + GlobalVariables.nd2CreaII) / 2;
        double nd2ED = double.parse(nd2VED.toStringAsFixed(1));

        final double nd2VFP = (GlobalVariables.nd2CtI +
                GlobalVariables.nd2ThcaI +
                GlobalVariables.nd2Fisica) /
            3;
        double nd2FP = double.parse(nd2VFP.toStringAsFixed(1));

        final double nd2VEG = GlobalVariables.nd2EnglishI;
        double nd2EG = double.parse(nd2VEG.toStringAsFixed(1));*/
        /////ND3/////
        GlobalVariables.nd3ProII =
            notasEstudiante['nd3']['nd3ProII'].toDouble();
        GlobalVariables.nd3CreaII =
            notasEstudiante['nd3']['nd3CreaII'].toDouble();
        GlobalVariables.nd3CtI = notasEstudiante['nd3']['nd3CtI'].toDouble();
        GlobalVariables.nd3ThcaI =
            notasEstudiante['nd3']['nd3ThcaI'].toDouble();
        GlobalVariables.nd3Fisica =
            notasEstudiante['nd3']['nd3Fisica'].toDouble();
        GlobalVariables.nd3EnglishI =
            notasEstudiante['nd3']['nd3EnglishI'].toDouble();


      /*  final double nd3VED =
            (GlobalVariables.nd3ProII + GlobalVariables.nd3CreaII) / 2;
        double nd3ED = double.parse(nd3VED.toStringAsFixed(1));

        final double nd3VFP = (GlobalVariables.nd3CtI +
                GlobalVariables.nd3ThcaI +
                GlobalVariables.nd3Fisica) /
            3;
        double nd3FP = double.parse(nd3VFP.toStringAsFixed(1));

        final double nd3VEG = GlobalVariables.nd3EnglishI;
        double nd3EG = double.parse(nd3VEG.toStringAsFixed(1));
*/
        ///GENERAL///
        final double proII = (GlobalVariables.nd1ProII +
                GlobalVariables.nd2ProII +
                GlobalVariables.nd3ProII) /
            3;
        final double creaII = (GlobalVariables.nd1CreaII +
                GlobalVariables.nd2CreaII +
                GlobalVariables.nd3CreaII) /
            3;
        final double ctI = (GlobalVariables.nd1CtI +
                GlobalVariables.nd2CtI +
                GlobalVariables.nd3CtI) /
            3;
        final double thcaI = (GlobalVariables.nd1ThcaI +
                GlobalVariables.nd2ThcaI +
                GlobalVariables.nd3ThcaI) /
            3;
        final double fisica = (GlobalVariables.nd1Fisica +
                GlobalVariables.nd2Fisica +
                GlobalVariables.nd3Fisica) /
            3;
        final double englishI = (GlobalVariables.nd1EnglishI +
                GlobalVariables.nd2EnglishI +
                GlobalVariables.nd3EnglishI) /
            3;

            final ED = notasEstudiante['nd1']['nd1ProII'].toDouble();
final FP = (notasEstudiante['nd1']['nd1CtI'] +
    notasEstudiante['nd1']['nd1ThcaI'] +
    notasEstudiante['nd1']['nd1Fisica']) /
    3;
final EG = notasEstudiante['nd1']['nd1EnglishI'].toDouble;
/*
        final double VED = (proII + creaII) / 2;
        double ED = double.parse(VED.toStringAsFixed(1));

        final dynamic VFP = (ctI + thcaI + fisica) / 3;
        double FP = double.parse(VFP.toStringAsFixed(1));

        final dynamic VEG = englishI;
        double EG = double.parse(VEG.toStringAsFixed(1));
*/
        setState(() {
          _chartData = getChartData();
          print(' se actualizo $_chartData $englishI');
        });
      } else {
        print('El estudiante no tiene notas en Firestore.');
      }
    } catch (error) {
      print('Error al consultar notas: $error');
    }
  }
}

class GDPData {
  GDPData(this.course, this.color);
  dynamic course;
  Color color;
}



//CONVERSION A STRINGS
String proIIString = GlobalVariables.proII.toStringAsFixed(1);
String creaIIString = GlobalVariables.creaII.toStringAsFixed(1);
String ctIString = GlobalVariables.ctI.toStringAsFixed(1);
String thcaIString = GlobalVariables.thcaI.toStringAsFixed(1);
String fisicaString = GlobalVariables.fisica.toStringAsFixed(1);
String englishIString = GlobalVariables.englishI.toStringAsFixed(1);

// PROMEDIOS DE ND1
String string_nd1ProII = GlobalVariables.nd1ProII.toStringAsFixed(1);
String string_nd1CreaII = GlobalVariables.nd1CreaII.toStringAsFixed(1);
String string_nd1CtI = GlobalVariables.nd1CtI.toStringAsFixed(1);
String string_nd1ThcaI = GlobalVariables.nd1ThcaI.toStringAsFixed(1);
String string_nd1Fisica = GlobalVariables.nd1Fisica.toStringAsFixed(1);
String string_nd1EnglishI = GlobalVariables.nd1EnglishI.toStringAsFixed(1);

// PROMEDIOS DE ND2
String string_nd2ProII = GlobalVariables.nd2ProII.toStringAsFixed(1);
String string_nd2CreaII = GlobalVariables.nd2CreaII.toStringAsFixed(1);
String string_nd2CtI = GlobalVariables.nd2CtI.toStringAsFixed(1);
String string_nd2ThcaI = GlobalVariables.nd2ThcaI.toStringAsFixed(1);
String string_nd2Fisica = GlobalVariables.nd2Fisica.toStringAsFixed(1);
String string_nd2EnglishI = GlobalVariables.nd2EnglishI.toStringAsFixed(1);

// PROMEDIOS DE ND3
String string_nd3ProII = GlobalVariables.nd3ProII.toStringAsFixed(1);
String string_nd3CreaII = GlobalVariables.nd3CreaII.toStringAsFixed(1);
String string_nd3CtI = GlobalVariables.nd3CtI.toStringAsFixed(1);
String string_nd3ThcaI = GlobalVariables.nd3ThcaI.toStringAsFixed(1);
String string_nd3Fisica = GlobalVariables.nd3Fisica.toStringAsFixed(1);
String string_nd3EnglishI = GlobalVariables.nd3EnglishI.toStringAsFixed(1);

// Crear un mapa con los nombres de los cursos como claves y los puntajes promedio como valores

*/