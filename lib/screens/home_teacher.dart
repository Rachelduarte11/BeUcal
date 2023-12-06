import 'package:flutter/material.dart';

class HomeTeacherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla del Docente"),
      ),
      body: Center(
        child: Text("Bienvenido, Docente"),
      ),
    );
  }
}