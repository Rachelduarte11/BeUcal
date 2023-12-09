import 'package:auto_size_text/auto_size_text.dart';
import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTeacherScreen extends StatelessWidget {
  const HomeTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;

    String greeting = getGreeting(hour);

    CustomAppBarTeacher(greeting);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBarTeacher(greeting),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 70),
                        height: 140,
                        width: 165,
                        decoration: BoxDecoration(color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)
                        ),                        
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 210,
                        width: 165,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 179, 201, 68),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 210,
                        width: 165,
                        child: Transform.translate(
                          offset: Offset(0.0,-80.0), 
                          child: Container(
                            decoration: BoxDecoration(color: Color.fromARGB(255, 179, 201, 68),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 140,
                        width: 165,
                        child: Transform.translate(offset: Offset(0, -45),
                          child: Container(
                          decoration: BoxDecoration(
                            color:const Color(0xff0BB49D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                        ),                        
                      ),
                    ],
                  ),                  
                  Row(
                    children: [Transform.translate(
                      offset: Offset(30, -70),
                      child: Container(margin: EdgeInsets.only(bottom: 30), child: const Text("Actividades",                    
                        style: TextStyle(color: Colors.black, fontSize: 23, fontFamily: 'Mitr')
                          )
                        ),
                    )
                    ],
                  )
                ],                
              ),              
            ),                        
          ),            
        ],        
      ),    
    );
  }
}

Container CustomAppBarTeacher(String greeting) {
  return Container(
    padding: EdgeInsets.fromLTRB(22, 0, 10, 0),
    margin: EdgeInsets.only(top: 30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/StackPath.jpeg"),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 6, 44, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          greeting,
                          style: const TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            height: 1,
                            color: Color(0xff313131),
                          ),
                          maxLines:
                              1, // Establece el número máximo de líneas que el texto puede ocupar
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(
                          "Jenner",
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: Color(0xff313131),
                          ),
                          maxLines:
                              1, // Establece el número máximo de líneas que el texto puede ocupar
                          overflow: TextOverflow
                              .ellipsis, // Manejo de desbordamiento,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Distribuir elementos en el espacio disponible
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: greyLight, // Color de fondo rojo
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: Badge(
                        //badgeContent: Text('4'),
                        child: Center(
                          child: Icon(
                            Icons.email,
                            color: greyDark, // Color del icono blanco
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15), // Espacio entre los iconos
                    GestureDetector(
                      onTap: () {
                        // Esto abre la pantalla de notificaciones
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()),
                        );*/
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[
                                300], // Gris claro para el fondo del contenedor
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        child: Badge(
                          //badgeContent: Text('5'),
                          child: Center(
                            child: Icon(
                              Icons.notifications,
                              color:
                                  Colors.grey[800], // Gris oscuro para el icono
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

String getGreeting(int hour) {
  if (hour >= 0 && hour < 12) {
    return 'Buenos días';
  } else if (hour >= 12 && hour < 18) {
    return 'Buenas tardes';
  } else {
    return 'Buenas noches';
  }
}

@override
Size get preferredSize => const Size.fromHeight(68.0);
