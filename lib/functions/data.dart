
import 'package:cloud_firestore/cloud_firestore.dart';

  // Función para obtener la URL de la foto de perfil desde Firestore
Future<String?> obtenerURLFotoUsuario(String studentId) async {
  try {
    DocumentReference<Map<String, dynamic>> documentRef = FirebaseFirestore.instance
        .collection('estudiantes')
        .doc(studentId)
        .collection('informacion')
        .doc('datos personales');

    // Obtener los datos del documento
    DocumentSnapshot<Map<String, dynamic>> snapshot = await documentRef.get();

    if (snapshot.exists) {
      // Obtener la URL de la foto de perfil
      String photoUrl = snapshot.data()?['urlPicture'] ?? '';

      return photoUrl;
    } else {
      // Si el documento no existe, o no tiene una URL de foto de perfil, devolver una cadena vacía
      return 'no hay nada';
    }
  } catch (e) {
    print('Error al obtener la URL de la foto de perfil: $e');
    return ''; // Devuelve una cadena vacía en caso de error
  }
}

