import 'package:becertus_proyecto/screens/calendar.dart';
import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:becertus_proyecto/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class AnalisisDatos extends StatefulWidget {
  const AnalisisDatos({super.key});

  @override
  State<AnalisisDatos> createState() => _AnalisisDatosState();
}

class _AnalisisDatosState extends State<AnalisisDatos> {
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xff12B19C),
            Color.fromARGB(255, 70, 215, 195).withOpacity(0.8),
            ],
          ),
        ),
      child: Scaffold(
        backgroundColor: Color(0xFFE8F8F7),
       // drawer: MyDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white, size: 22,),
            onPressed: () {
              // Acción al presionar el botón de retroceso
              Navigator.pop(context);
            },
          ),
           title: Text(
          'Analista de Datos',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold), // Texto de color negro
        ),
          backgroundColor: Color(0xff12B19C),
          elevation: 0,
        ),
        bottomNavigationBar: CustomeNavigationBar(onTab),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          
             child: Container(
                alignment: Alignment.bottomCenter,
                width:MediaQuery.of(context).size.width ,
                height:MediaQuery.of(context).size.height  ,
              decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xff12B19C),
            Color.fromARGB(255, 228, 159, 243).withOpacity(0.8),
            ],
          ),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Container(
                alignment: Alignment.bottomCenter,
                width:MediaQuery.of(context).size.width ,
                height:MediaQuery.of(context).size.height*0.6  ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                topRight: Radius.circular(40))
              ),),],),
             
          ),
        )
      ),
    );

  }
}