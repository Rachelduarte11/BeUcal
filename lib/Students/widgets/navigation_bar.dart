import 'dart:ui';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:becertus_proyecto/Students/screens/view_task.dart';
import 'package:becertus_proyecto/Students/widgets/chip_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

typedef VoidCallbackParam = Function(int index);

// ignore: must_be_immutable
class CustomeNavigationBar extends StatefulWidget {
  VoidCallbackParam voidCallbackParam;
  CustomeNavigationBar(this.voidCallbackParam, {super.key});

  @override
  State<CustomeNavigationBar> createState() => _CustomeNavigationBarState();
}

class FirebaseAuth {
}

class _CustomeNavigationBarState extends State<CustomeNavigationBar> {
  int currentIndex = 0;

  void onTab(int index) {
    setState(() {
      if (index != 4) {
        // Cambiado de 3 a 4
        currentIndex = index;
        widget.voidCallbackParam(index);
      }
    });
  }

  TextEditingController tituloController = TextEditingController(text: "");
  TextEditingController notasController = TextEditingController(text: "");

//barra de menu
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 30),
        child: BottomNavigationBar(
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 28,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.stacked_bar_chart_rounded,
                size: 28,
              ),
              label: 'Stack',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: 28,
                ),
                label: 'Calendar'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 28,
              ),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: SpeedButton(),
              label: 'Add',
            )
          ],
          onTap: onTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(18, 107, 107, 107),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: currentIndex,
          unselectedItemColor: const Color.fromARGB(255, 107, 107, 107),
          selectedItemColor: Color.fromARGB(255, 34, 34, 33),
        ),
      ),
    );
  }
}

//Boton de bottomnavigationbar que tiene la funcionalidad de SpeedDial,
// osea se despliegan hacia arriba tres opciones para que el estudiante selecciones
class SpeedButton extends StatelessWidget {
  const SpeedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      buttonSize: const Size.fromRadius(15),
      backgroundColor: const Color(0xFFFD6A6A),
      overlayColor: Colors.black,
      overlayOpacity: 0.4,
      spaceBetweenChildren: 2,
      child: Center(
        child: Icon(
          Icons.add_rounded,
          size: 36,
        ),
      ),
      children: [
        SpeedDialChild(
          labelWidget: Container(
            width: 180,
            padding:
                const EdgeInsets.all(4.0), // Espacio alrededor del contenedor
            decoration: BoxDecoration(
              color: redStatic, // Color de fondo personalizado
              borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
            ),
            child: const Text(
              'Nuevo Tarea',
              style: TextStyle(
                fontFamily: 'Mitr',
                fontWeight: FontWeight.w400,
                fontSize: 18, // Tamaño de fuente personalizado
                color: Colors.white, // Color del texto
              ),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            _showModalBottomSheet(context);
          },
        ),
        SpeedDialChild(
          labelWidget: Container(
            width: 180,
            padding:
                const EdgeInsets.all(4.0), // Espacio alrededor del contenedor
            decoration: BoxDecoration(
              color: redStatic, // Color de fondo personalizado
              borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
            ),
            child: const Text(
              'Tareas',
              style: TextStyle(
                fontFamily: 'Mitr',
                fontWeight: FontWeight.w400,
                fontSize: 18, // Tamaño de fuente personalizado
                color: Colors.white, // Color del texto
              ),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => ViewTasks()),
            );
          },
        ),
      ],
    );
  }
  //Size get preferredSize => const Size.fromHeight(53.0);
}

// ---- Nueva Tarea

void _showModalBottomSheet(BuildContext context,) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      TextEditingController tituloController = TextEditingController(text: "");
      TextEditingController notasController = TextEditingController(text: "");
      return Container(
        decoration: const BoxDecoration(
            color: Color(0XFFF3F3F3),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 1.44,
        //Contiene los tres botones de la ventana emergente
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 16,
                          fontFamily: 'Mitr'),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Cierra la hoja de acción
                  },
                ),
                Text(
                  'Nueva Tarea',
                  style: TextStyle(
                      fontFamily: 'Mitr',
                      fontSize: 20,
                      color: greyDark,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  child: Text(
                    'Agregar',
                    style: TextStyle(
                      fontFamily: 'Mitr',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    //Logica para Id estudiante: 
                    String studentId = "eGYtAQiyan12554BOG6D";
                    // Acción cuando se selecciona la opción 2
                    _agregarTareaFirestore(tituloController, notasController, studentId);
                    Navigator.pop(context); // Cierra la hoja de acción
                  },
                ),
                // Agrega más elementos según tus necesidades
              ],
            ),
            
            const SizedBox(
              height: 20,
            ),
            //titulo controller
            Container(
              height:
                  40.0, 
              child: TextField(
                controller: tituloController,
                style: const TextStyle(
                  color: Colors.black, 
                ),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.all(10.0), 
                  hintText: tituloController.text.isEmpty
                      ? 'Titulo'
                      : '', 
                  filled: true,
                  fillColor: const Color.fromARGB(
                      255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, 
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            //Notas controller
            SizedBox(height: 8),
            Container(
              height: 150,
              padding: EdgeInsets.only(left: 10, top: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xffD9D9D9)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: notasController,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: tituloController.text.isEmpty ? 'Notas' : '',
                        contentPadding: EdgeInsets.zero,
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Arimo',
                          color: Color(0xff4B4B4B),
                        ),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color(0xff4B4B4B),
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _textUserOption('Selecciona la etiqueta'),
            SizedBox(
              height: 10,
            ),
            Wrap(spacing: 4, runSpacing: 2, children: [
              chipData('Creatividad', 0xffC9D32B),
              chipData('Fisíca', 0xffF4A50B),
              chipData('Construcción y Tecnología', 0xff00667C),
              chipData('Teoría, Historia y...', 0xff44DECC),
              chipData('Proyecto 1', 0xffFD6A6A),
              chipData('Inglés 1', 0xffEB078D),
            ]),
            const SizedBox(
              height: 12,
            ),
            _textUserOption('Elige la fecha'),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _TimeElection(context, Icons.calendar_today, 'Hoy'),
                    _TimeElection(context, Icons.calendar_view_week, 'Mañana'),
                    _TimeElection(
                        context, Icons.calendar_month, 'Proxima semana'),
                    _TimeElection(context, Icons.edit_calendar, 'Fecha y hora'),
                  ]),
            ),
          ],
        ),
      );
    },
  );
}

Container _textUserOption(String textUser) {
  return Container(
    margin: EdgeInsets.only(left: 5),
    alignment: Alignment.centerLeft,
    child: Text(
      textUser,
      style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Mitr',
          color: Color(0xff4B4B4B),
          fontWeight: FontWeight.w500),
      textAlign: TextAlign.start,
    ),
  );
}

Container _TextField(BuildContext context, double myHeight, String actionUser) {
  return Container(
    height: myHeight,
    padding: EdgeInsets.only(left: 10, top: 0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Color(0xffD9D9D9)),
      borderRadius: BorderRadius.circular(10),
    ),
    //width: MediaQuery.of(context).size.width *0.85,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: actionUser, //Eltexto que se ve dentro del contenedor
              contentPadding: EdgeInsets.zero,
              hintStyle: TextStyle(
                  fontSize: 16, fontFamily: 'Arimo', color: Color(0xff4B4B4B)),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: InputBorder.none,
            ),
            style: TextStyle(
                color: Color(0xff4B4B4B),
                fontFamily: 'Arimo',
                fontWeight: FontWeight.w400,
                fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    ),
  );
}

Container _TimeElection(
    BuildContext context, IconData optionIcon, String options) {
  return Container(
    child: Row(children: [
      Container(
        width: 80,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 4),
              width: 85,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                optionIcon,
                color: redStatic,
                size: 40,
              ),
            ),
            Text(
              options,
              style: const TextStyle(
                  color: Color(0xff4B4B4B),
                  fontFamily: 'Arimo',
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )
    ]),
  );
}

// Función agregarTarea a firestore

void _agregarTareaFirestore(TextEditingController tituloController, TextEditingController notasController, String studentId)async {
  // Accede a la instancia de Firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Obtén los valores de título y notas directamente de los controladores
  String titulo = tituloController.text;
  String notas = notasController.text;

  // Comprueba si el título no está vacío antes de agregar la tarea
  if (titulo.isNotEmpty) {
    try {
      // Obtén una referencia al documento del estudiante
      DocumentReference estudianteDoc = firestore.collection('estudiantes').doc(studentId);
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

      // Crea un nuevo documento en la colección "tareas" dentro del documento del estudiante
      await estudianteDoc.collection('tareas').add({
        'titulo': titulo,
        'notas': notas,
        'timestamp': FieldValue.serverTimestamp(),
        'fecha': formattedDate,
      });

      // Muestra un mensaje o realiza otras acciones según tus necesidades
      print('Tarea agregada exitosamente');
    } catch (error) {
      // Maneja el error al agregar la tarea a Firestore
      print('Error al agregar la tarea a Firestore: $error');
    }
  } else {
    // Muestra un mensaje de error si el título está vacío
    print('Error: El título no puede estar vacío');
  }
}
