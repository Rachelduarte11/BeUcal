import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansión de Contenedor'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 300,
            left: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 25, top: 10, bottom: 5),
                            child: Text(
                              "Enfoque estratégico de Diseño Arquitectónico",
                              style: TextStyle(
                                fontFamily: "Mitr",
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          ),
                          iconSize: 35,
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                      ],
                    ),
                    if (isExpanded)
                      Image.asset(
                        'assets/images/estudios_generales_muestra.PNG',
                        width: 350,
                        height: 150,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
