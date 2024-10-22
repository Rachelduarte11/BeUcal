
//Archivo para agregar notas
/*
void main() async {
  // Inicializa Firebase
  await Firebase.initializeApp();

  // Agrega notas al primer estudiante
  agregarNotas('zHgiM3N9nJXrnT9HbDUw');
  print('Notas del primer estudiante agregadas');

}

void agregarNotas(String estudianteId) {
  // Accede a la instancia de Firebase Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Define las notas para el estudiante
  Map<String, dynamic> notasEstudiante = {
    'nd1': {
      'nd1ProII': 14,
      'nd1CreaII': 19,
      'nd1CtI': 15,
      'nd1ThcaI': 17,
      'nd1Fisica': 17,
      'nd1EnglishI': 17,
    },
    'nd2': {
      'nd2ProII': 19,
      'nd2CreaII': 14,
      'nd2CtI': 18,
      'nd2ThcaI': 17,
      'nd2Fisica': 16,
      'nd2EnglishI': 17,
    },
    'nd3': {
      'nd3ProII': 17,
      'nd3CreaII': 20,
      'nd3CtI': 18,
      'nd3ThcaI': 17,
      'nd3Fisica': 19,
      'nd3EnglishI': 13,
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
}*/