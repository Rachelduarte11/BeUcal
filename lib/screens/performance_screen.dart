import 'package:flutter/material.dart';

class MyPerformance extends StatelessWidget {
  const MyPerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEDFFFB),
        body: Stack(
          children: [
           Positioned(
            child: Container(
              width: 400,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
                //borde a un único lado
                borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ]
              ),
              child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20.0,
                        left: 20.0,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            "Carlos Paz",
                            style: TextStyle(
                              fontSize: 33,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Mitr",
                            ),
                          ),
                          Text(
                            "Arquitectura",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Mitr",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 80),
                    //Separación de 2 container texto + imagen
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          //shape: hace la forma circular
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey, 
                            width: 4,         
                          ),
                          //Una forma para fácil para poner la imagen circular
                          image: const DecorationImage(
                            image: AssetImage("assets/images/StackPath.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ]
                  ),     
                  /*Column(
                    children: [
                      Text("16,54"),
                      Row(
                        children: [
                          Text("Alessandro arias"),
                          SizedBox(width: 16.0,)
                        ],
                      )
                    ],
                  )*/
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}