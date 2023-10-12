
import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({Key? key,
    this.title,
    this.iconData,
    this.iconColor,
    this.time,
    this.check,
    this.iconBgColor,
  }) : super(key: key);

//Asignacion de valores de tarjeta de forma dinamica

  final String? title;
  final IconData? iconData;
  final Color? iconColor;
  final String? time;
  final bool? check;
  final Color? iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                activeColor: Color.fromARGB(255, 0, 175, 76),
                checkColor: Color.fromARGB(255, 249, 249, 249),
                value: check,
                onChanged: (Bool) {},
              ),
            ),
            data: ThemeData(
              primarySwatch: Colors.green,
              unselectedWidgetColor: Color.fromARGB(255, 162, 162, 162),
            ),
          ),
          Expanded(
            child: Container(
              height: 65,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.white,
                child: Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 33,
                    width: 36,
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      iconData, color: iconColor ,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: Text(
                      'Lets Wake Up',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                    ),
                  ),
                  const Text(
                    '11 PM',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 1,
                      color: Color.fromARGB(255, 75, 75, 75),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
