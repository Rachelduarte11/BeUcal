import 'package:flutter/material.dart';

class ToDoCard extends StatefulWidget {
  final String titleTask;
  final String timeTask;
  final bool check;
  final Widget chip;

  ToDoCard({
    required this.titleTask,
    required this.timeTask,
    required this.check,
    required this.chip,
  });

  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool isExpanded = false;
  bool isSwiped = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.titleTask),
      background: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: 10,
        color: Colors.red,
        height: 30,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(left: 200),
        child: Center(
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Confirmar',
                  style: TextStyle(
                    color: Colors
                        .black, // Cambiar a negro o a otro color más oscuro según el diseño
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  '¿Estás seguro de que quieres eliminar esta tarea?',
                  style: TextStyle(
                    color: Colors
                        .black, // Cambiar a negro o a otro color más oscuro según el diseño
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors
                            .black, // Cambiar a negro o a otro color más oscuro según el diseño
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      'Sí',
                      style: TextStyle(
                        color: Colors
                            .black, // Cambiar a negro o a otro color más oscuro según el diseño
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
        return false;
      },
      onDismissed: (direction) {
        // Lógica para eliminar la tarea aquí
      },
      
            child: modelAddTask(context),
    );
  }

  Container modelAddTask(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height:
          isExpanded ? 120 : 65, // Cambiar la altura según si está expandido
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(51, 0, 0, 0),
            offset: Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Theme(
                child: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    shape: CircleBorder(),
                    activeColor: Color(0xff44DECC),
                    checkColor: Color.fromARGB(255, 249, 249, 249),
                    value: widget.check,
                    onChanged: (Bool) {},
                  ),
                ),
                data: ThemeData(
                  primarySwatch: Colors.green,
                  unselectedWidgetColor: Color(0xff44DECC),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titleTask,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Arimo',
                        color: Color(0xFF323232),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.timeTask,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Arimo',
                        color: Color(0xFF323232),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded =
                        !isExpanded; // Cambia el estado al tocar la flecha
                  });
                },
                child: Row(
                  children: [
                    widget.chip,
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/elements/flecha-hacia-abajo-para-navegar (1).png',
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isExpanded)
            Container(
              // Aquí puedes agregar detalles adicionales cuando está expandido
              padding: EdgeInsets.all(16),
              child: Text(
                'Detalles adicionales aquí',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF323232),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
