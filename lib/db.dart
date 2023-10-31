import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Inicializa Firebase
  await Firebase.initializeApp();

  // Agrega notas al primer estudiante
  agregarNotas('ID_ESTUDIANTE_1');
  print('Notas del primer estudiante agregadas');

}

void agregarNotas(String estudianteId) {
  // Accede a la instancia de Firebase Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Define las notas para el estudiante
  Map<String, dynamic> notasEstudiante = {
    'nd1': {
      'nd1ProII': 19,
      'nd1CreaII': 19,
      'nd1CtI': 15,
      'nd1ThcaI': 17,
      'nd1Fisica': 19,
      'nd1EnglishI': 17,
    },
    'nd2': {
      'nd2ProII': 19,
      'nd2CreaII': 19,
      'nd2CtI': 18,
      'nd2ThcaI': 17,
      'nd2Fisica': 19,
      'nd2EnglishI': 20,
    },
    'nd3': {
      'nd3ProII': 18,
      'nd3CreaII': 18,
      'nd3CtI': 18,
      'nd3ThcaI': 19,
      'nd3Fisica': 19,
      'nd3EnglishI': 20,
    },
  };

  // Añade las notas al estudiante especificado
  DocumentReference estudianteRef = firestore.collection('estudiantes').doc(estudianteId);
  DocumentReference notasRef = estudianteRef.collection('notas').doc('notas_estudiante');

  // Utiliza el método set para guardar las notas en la ruta especificada
  notasRef.set(notasEstudiante).then((_) {
    print('Notas agregadas a Firestore');
  }).catchError((error) {
    print('Error al agregar notas: $error');
  });
}