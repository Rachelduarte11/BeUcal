import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotasEstudiante {
  double? nd1ProII;
  double? nd1CreaII;
  double? nd1CtI;
  double? nd1ThcaI;
  double? nd1Fisica;
  double? nd1EnglishI;

  double? nd2ProII;
  double? nd2CreaII;
  double? nd2CtI;
  double? nd2ThcaI;
  double? nd2Fisica;
  double? nd2EnglishI;

  double? nd3ProII;
  double? nd3CreaII;
  double? nd3CtI;
  double? nd3ThcaI;
  double? nd3Fisica;
  double? nd3EnglishI;

  NotasEstudiante.fromMap(Map<String, dynamic> map) {
    nd1ProII = map['nd1']['nd1ProII']?.toDouble();
    nd1CreaII = map['nd1']['nd1CreaII']?.toDouble();
    nd1CtI = map['nd1']['nd1CtI']?.toDouble();
    nd1ThcaI = map['nd1']['nd1ThcaI']?.toDouble();
    nd1Fisica = map['nd1']['nd1Fisica']?.toDouble();
    nd1EnglishI = map['nd1']['nd1EnglishI']?.toDouble();

    nd2ProII = map['nd2']['nd2ProII'].toDouble();
    nd2CreaII = map['nd2']['nd2CreaII'].toDouble();
    nd2CtI = map['nd2']['nd2CtI'].toDouble();
    nd2ThcaI = map['nd2']['nd2ThcaI'].toDouble();
    nd2Fisica = map['nd2']['nd2Fisica'].toDouble();
    nd2EnglishI = map['nd2']['nd2EnglishI'].toDouble();

    nd3ProII = map['nd3']['nd3ProII'].toDouble();
    nd3CreaII = map['nd3']['nd3CreaII'].toDouble();
    nd3CtI = map['nd3']['nd3CtI'].toDouble();
    nd3ThcaI = map['nd3']['nd3ThcaI'].toDouble();
    nd3Fisica = map['nd3']['nd3Fisica'].toDouble();
    nd3EnglishI = map['nd3']['nd3EnglishI'].toDouble();

    // Repite el proceso para nd2 y nd3
  }
}

/*
class MyApptry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userId;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notas de Estudiante'),
        ),
        body: Center(
          child: FutureBuilder<NotasEstudiante>(
            future: Provider.of<NotasProvider>(context).obtenerNotasEstudiante(user),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data == null) {
                return Text('No se encontraron datos');
              } else {
                final notas = snapshot.data!;

                // Ahora puedes acceder a las notas en cualquier parte de tu aplicación.
                final nd1ProII = notas.nd1ProII;
                final nd2CreaII = notas.nd2CreaII;
                // ...

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Notas del estudiante:'),
                    Text('nd1ProII: $nd1ProII'),
                    Text('nd2CreaII: $nd2CreaII'),
                    // ...
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
*/
class NotasProvider with ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> allCursos = {};
  NotasEstudiante? _notas;
  double? nd1ProII;
  double? nd1CreaII;
  double? nd1CtI;
  double? nd1ThcaI;
  double? nd1Fisica;
  double? nd1EnglishI;

  double? nd2ProII;
  double? nd2CreaII;
  double? nd2CtI;
  double? nd2ThcaI;
  double? nd2Fisica;
  double? nd2EnglishI;

  double? nd3ProII;
  double? nd3CreaII;
  double? nd3CtI;
  double? nd3ThcaI;
  double? nd3Fisica;
  double? nd3EnglishI;

  double? proII;
  double? creaII;
  double? ctI;
  double? thcaI;
  double? fisica;
  double? englishI;

  double? VED;
  double? ED;
  double? VFP;
  double? FP;
  double? VEG;
  double? EG;

  double? nd1VED;
  double? nd1ED;
  double? nd1VFP;
  double? nd1FP;
  double? nd1VEG;
  double? nd1EG;

  double? nd2VED;
  double? nd2ED;
  double? nd2VFP;
  double? nd2FP;
  double? nd2VEG;
  double? nd2EG;

  double? nd3VED;
  double? nd3ED;
  double? nd3VFP;
  double? nd3FP;
  double? nd3VEG;
  double? nd3EG;
/*
  NotasProvider() {
    // Llamar a esta función en el constructor si quieres cargar las notas al inicio
    obtenerNotasEstudiante();
  }

*/
  Future<NotasEstudiante> obtenerNotasEstudiante(String studentId) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('estudiantes')
            .doc(studentId)
            .collection('notas')
            .doc('notas_estudiante')
            .get();

    Map<String, dynamic>? notasEstudiante = querySnapshot.data();
    _notas = NotasEstudiante.fromMap(notasEstudiante!);

    nd1ProII = _notas?.nd1ProII;
    nd1CreaII = _notas?.nd1CreaII;
    nd1CtI = _notas?.nd1CtI;
    nd1ThcaI = _notas?.nd1ThcaI;
    nd1Fisica = _notas?.nd1Fisica;
    nd1EnglishI = _notas?.nd1EnglishI;

    nd2ProII = _notas?.nd2ProII;
    nd2CreaII = _notas?.nd2CreaII;
    nd2CtI = _notas?.nd2CtI;
    nd2ThcaI = _notas?.nd2ThcaI;
    nd2Fisica = _notas?.nd2Fisica;
    nd2EnglishI = _notas?.nd2EnglishI;

    nd3ProII = _notas?.nd3ProII;
    nd3CreaII = _notas?.nd3CreaII;
    nd3CtI = _notas?.nd3CtI;
    nd3ThcaI = _notas?.nd3ThcaI;
    nd3Fisica = _notas?.nd3Fisica;
    nd3EnglishI = _notas?.nd3EnglishI;

    proII = (nd1ProII! + nd2ProII! + nd3ProII!) / 3;
    creaII = (nd1CreaII! + nd2CreaII! + nd3CreaII!) / 3;
    ctI = (nd1CtI! + nd2CtI! + nd3CtI!) / 3;
    thcaI = (nd1ThcaI! + nd2ThcaI! + nd3ThcaI!) / 3;
    fisica = (nd1Fisica! + nd2Fisica! + nd3Fisica!) / 3;
    englishI = (nd1EnglishI! + nd2EnglishI! + nd3EnglishI!) / 3;

    VED = ((proII ?? 0) + (creaII ?? 0)) / 2;
    ED = VED;

    VFP = ((ctI ?? 0) + (thcaI ?? 0) + (fisica ?? 0)) / 3;
    FP = VFP;

    VEG = englishI ?? 0;
    EG = VEG;

    nd1VED = ((nd1ProII ?? 0) + (nd1CreaII ?? 0)) / 2;
    nd1ED = nd1VED;

    nd1VFP = ((nd1CtI ?? 0) + (nd1ThcaI ?? 0) + (nd1Fisica ?? 0)) / 3;
    nd1FP = nd1VFP;

    nd1VEG = nd1EnglishI ?? 0;
    nd1EG = nd1VEG;

    nd2VED = ((nd2ProII ?? 0) + (nd2CreaII ?? 0)) / 2;
    nd2ED = nd2VED;

    nd2VFP = ((nd2CtI ?? 0) + (nd2ThcaI ?? 0) + (nd2Fisica ?? 0)) / 3;
    nd2FP = nd2VFP;

    nd2VEG = nd2EnglishI ?? 0;
    nd2EG = nd2VEG;

    nd3VED = ((nd3ProII ?? 0) + (nd3CreaII ?? 0)) / 2;
    nd3ED = nd3VED;

    nd3VFP = ((nd3CtI ?? 0) + (nd3ThcaI ?? 0) + (nd3Fisica ?? 0)) / 3;
    nd3FP = nd3VFP;

    nd3VEG = nd3EnglishI ?? 0;
    nd3EG = nd3VEG;

    print(obtenerNotasEstudiante(studentId));
    notifyListeners();
    return _notas!;
  }

  NotasProvider get notasProvider => this;
}
