import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.fromLTRB(22, 0, 10, 0),
      margin: EdgeInsets.only(top: 54),
      //child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            //margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0,0,28,0),
                  //margin: EdgeInsets.only(left: 2),
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: [
                    Container(
                    child:
                    Text(
                      'Hola, Carlos',
                      style: TextStyle(
                        fontFamily: 'Mitr',
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: Color(0xff313131),
                      ),
                    ),
                  ),
                  
                    Text(
                      // administraciondesistemasKXd (1:41)
                      'Administracion de Sistemas',
                      style: TextStyle(
                        fontFamily: 'Mitr',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: Color(0xff313131),
                      ),
                    ),
                
                  ]
                  ),
                ),
              ],
            ),
          ),
          Container(
            //margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xff9d9898),
                width: 2.0,
              ),
            ),
            child: Center(
              // ellipse17Cb (1:3)
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/bf/6b/58/bf6b58acda530c62c5c2d5ae6daad222.jpg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
