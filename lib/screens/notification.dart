import 'package:becertus_proyecto/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:becertus_proyecto/widgets/navigation_bar.dart';
import 'package:badges/badges.dart';
import 'package:becertus_proyecto/widgets/group_home.dart';
import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/calendar.dart';
import 'package:becertus_proyecto/screens/profile.dart';

// Primero, el modelo de la notificación
class NotificationModel {
  String title;
  String body;
  String subtitle;
  Widget leading; // Puedes cambiar esto por DateTime si es necesario

  NotificationModel({
    required this.title,
    required this.body,
    required this.subtitle,
    required this.leading,
  });
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreen();
}

// Ahora, la pantalla de notificaciones
class _NotificationScreen extends State<NotificationScreen> {
  final List<Widget> screens = [
    HomePage(),
    MyPerformance(),
    Calendar(),
    MyProfile(),
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

  // Esta lista debe venir de tus datos, aquí hay ejemplos
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Resultado de evaluaciones',
      body:
          'Los resultados de su evaluación de Inglés han sido subidos a la plataforma.',
      subtitle: '',
      leading: Icon(Icons.assessment, color: Colors.black),
    ),
    NotificationModel(
      title: 'Recordatorio de calendario',
      body: 'Tienes una tarea programada en el calendario',
      subtitle: '',
      leading: Icon(Icons.timer, color: Colors.black),
    ),
    NotificationModel(
      title: 'Dr. Martin Pilier',
      body: 'Cardiólogo',
      subtitle: 'Lima - 1km',
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/StackPath.jpeg'),
        backgroundColor: Colors.transparent,
      ),
    ),
    NotificationModel(
      title: 'Dr. Martin Pilier',
      body: 'Cardiólogo',
      subtitle: 'Lima - 1km',
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/StackPath.jpeg'),
        backgroundColor: Colors.transparent,
      ),
    ),
    NotificationModel(
      title: 'Dr. Martin Pilier',
      body: 'Cardiólogo',
      subtitle: 'Lima - 1km',
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/StackPath.jpeg'),
        backgroundColor: Colors.transparent,
      ),
    ),
    // Agrega más modelos de notificaciones aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F8F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Hace el AppBar transparente
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Notificaciones',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold), // Texto de color negro
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,
                color: Colors.black), // Ícono de búsqueda de color negro
            onPressed: () {
              // Aquí puedes añadir la funcionalidad para la búsqueda
            },
          ),
        ],
      ),
      body: currentIndex >= 0 && currentIndex < screens.length
          ? screens[currentIndex]
          : notificationListView(),
      bottomNavigationBar: CustomeNavigationBar(onTab),
    );
  }

  Widget notificationListView() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        var notification = notifications[index];
        return Card(
          color: Colors.transparent,
          elevation: 0,
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              child: notification.leading,
            ),
            title: Text(
              notification.title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(notification.body, style: TextStyle(color: Colors.black)),
                Text(notification.subtitle,
                    style: TextStyle(color: Colors.black)),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {
                // Acción del botón
              },
            ),
          ),
        );
      },
    );
  }
}