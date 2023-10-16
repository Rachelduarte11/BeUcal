import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                margin: EdgeInsets.only(left: 122.6),
                
                alignment: Alignment.topRight,
                height: 280,
                width: 270,
                
                
                color: Color.fromARGB(47, 47, 47, 47),                
                  child: 
                      SizedBox (                         
                          height: 300,
                          width: 350,
                          child:Stack(                           
                            //alignment: Alignment.topRight,
                            //alignment: Alignment.center,
                            children: [
                              Image.asset('assets/elements/Group 32.png')
                            ],
                          )                                                
                        ),                  
                ),
                
                Expanded(child:
                  Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 500.0),
                  height: 260,
                  width: 315,
                color: Color.fromARGB(249, 30, 30, 30),                
                  child: 
                  
                      SizedBox(     
                                          
                          height: 100,
                          width: 100,
                          child: Stack(                           
                        
                            children: [
                              Image.asset('assets/elements/Group 33.png')
                            ],
                          )                                                
                        ),                  
                ),
                ),
          
                ]
          
              ),
          ),
          
        );      
    

  }
}
      