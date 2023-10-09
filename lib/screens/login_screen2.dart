import "package:flutter/material.dart";

class LoginScreen2 extends StatefulWidget {
  static String id = 'login_screen2';

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset('elements/LOGOTIPO BECERTUS 1.png',
              height: 100.0,
              
              ),
              SizedBox(height: 15.0,),
              _userTextField(),
              SizedBox(height: 15,),
              _passwordTextField(),
              SizedBox(height: 20.0,),
              _bottonLogin(),

            ],
          )

        ),
      ),
      );
  }
  
  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 
            ),
          ),
        );
      }, stream: null,
    );
  }
  
  Widget _passwordTextField() {
        return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(

            ),
          ),
        );
      }, stream: null,
    );
  }
  
  _bottonLogin() {}
}

