import 'package:becertus_proyecto/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    Key? key,
    this.title,
    this.time,
    this.check,
    this.iconBgColor,
  }) : super(key: key);

//Asignacion de valores de tarjeta de forma dinamica

  final String? title;
  final String? time;
  final bool? check;
  final Color? iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
     
      child: Row(
        children: [
      
          Expanded(
            child: Container(
              
              height: 60,
              child: Card(
                
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.white,
                elevation: 2,
                shadowColor: greyDark,
                child: Row(children: [
                  Container(
                    
                    padding: const EdgeInsets.only(left: 10),
                    child: Theme(
                      
                      // ignore: sort_child_properties_last
                      child: Transform.scale(
                        scale: 1.7,
                        child: Checkbox(
                          shape: CircleBorder(
                          ),
                          activeColor: Color.fromARGB(255, 0, 175, 76),
                          checkColor: Color.fromARGB(255, 249, 249, 249),
                          
                          value: check,
                          onChanged: (Bool) {},
                        ),
                      ),
                      data: ThemeData(
                        primarySwatch: Colors.green,
                        unselectedWidgetColor:Color.fromARGB(255, 249, 249, 249),
                        
                      ),
                    ),
                  ),
                  Container(
                    height: 33,
                    width: 36,
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Lets Wake Up',
                      style: TextStyle(
                        fontFamily: 'Arimo',
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 75, 75, 75),
                      ),
                    ),
                  ),
                  Icon(
  Icons.person_add_alt_rounded,
  color: Color.fromARGB(255, 75, 75, 75),
  size: 22, // Ajusta el tamaño del ícono según tus necesidades
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
