import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;


//Es algo que va a venir en el futuro: promesa
Future<List> getConfigProfile() async {

  List email = [];

  //Coincidir nombre de la base de datos
  CollectionReference collectionReferenceEmail = db.collection('Emails');

  //Información traida
  QuerySnapshot queryEmail = await collectionReferenceEmail.get();

  //agregando la email
  for (var documento in queryEmail.docs) { 
    email.add(documento.data());
  }

  return email;
}

//Por terminar...