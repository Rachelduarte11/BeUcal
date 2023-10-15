import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});
Widget build(BuildContext context) {
  final Size = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                color: Color.fromARGB(255, 213, 213, 213),                
                  child: 
                      SizedBox(                         
                          height: 80,
                          width: 200,
                          child: Stack(                           
                            alignment: Alignment.topLeft,
                            children: [
                              Image.asset('assets/elements/LOGOTIPO BECERTUS 1.png')
                            ],
                          )                                                
                        ),                  
                ),
                ]
              
          ),
          
        ),
      
    );

  }
}
      