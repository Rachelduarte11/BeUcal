

import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String titleTask;
  final String timeTask;
  final bool check;
  final Widget chip;
  ToDoCard(
      {required this.titleTask, required this.timeTask, required this.check, required this.chip});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width ,//* 0.92,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
             borderRadius: BorderRadius.circular(10),
             boxShadow: [
              BoxShadow(color:Color.fromARGB(51, 0, 0, 0), 
              offset: Offset(0, 3), blurRadius:4)
             ]),
        child:
            Row(//
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
          SizedBox(
            //width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Theme(
                  // ignore: sort_child_properties_last
                  child: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: CircleBorder(),
                      activeColor: Color(0xff44DECC),
                      checkColor: Color.fromARGB(255, 249, 249, 249),
                      value: check,
                      onChanged: (Bool) {},
                    ),
                  ),
                  data: ThemeData(
                    primarySwatch: Colors.green,
                    unselectedWidgetColor: Color(0xff44DECC),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titleTask,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Arimo',
                            color: Color(0xFF323232),
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        timeTask,
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Arimo',
                            color: Color(0xFF323232),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Spacer(),
         Row(
           
             children: [
               chip,
                SizedBox(width: 10,),
               Image.asset(
                  'assets/elements/flecha-hacia-abajo-para-navegar (1).png',
                  width: 18,
                  height: 18,
                ),
             ],
           
         )
        ]));
  }
}









































/*
class ToDoCard extends StatelessWidget {
  const ToDoCard({
    Key? key,
    this.nameTasks,
    this.timeTasks,
    this.check,
  }) : super(key: key);

//Asignacion de valores de tarjeta de forma dinamica

  final String? nameTasks;
  final String? timeTasks;
  final bool? check;

  @override
  Widget build(
    BuildContext context,
  ) {
    String nameTasks='';
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
                          shape: CircleBorder(),
                          activeColor: Color.fromARGB(255, 0, 175, 76),
                          checkColor: Color.fromARGB(255, 249, 249, 249),
                          value: check,
                          onChanged: (Bool) {},
                        ),
                      ),
                      data: ThemeData(
                        primarySwatch: Colors.green,
                        unselectedWidgetColor:
                            Color.fromARGB(255, 249, 249, 249),
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        nameTasks,
                        style: TextStyle(
                          fontFamily: 'Arimo',
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 75, 75, 75),
                        ),
                      ),
                      //Feha
                      Text(
                        dateTasks,
                        style: TextStyle(
                          fontFamily: 'Arimo',
                          fontSize: 12,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 75, 75, 75),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}*/
