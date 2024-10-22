import 'package:flutter/material.dart';

class CalendarTeacher extends StatelessWidget {
  const CalendarTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color(0xffE8F8F6),),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                width: MediaQuery.of(context).size.width*0.8,
          height: MediaQuery.of(context).size.height *0.2,
                decoration: BoxDecoration(
              
              image: DecorationImage(
                  image: AssetImage('assets/images/working.png'))),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Estamos trabajando para traerte nuevas funcionalidades',
                  style: TextStyle(
                  fontFamily: 'Mitr', fontSize: 18, color: Color(0xff323232)),
                textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
