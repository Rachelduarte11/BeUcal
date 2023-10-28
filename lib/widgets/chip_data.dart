import 'package:flutter/material.dart';

Widget chipData(String label, int color) {
  return Chip(
    backgroundColor: Color(color),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    label: Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Arimo',
        color: Colors.white,
      ),
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
  );
}

Widget chipData2(String label, int color) {
  return Chip(
    backgroundColor: Color(color),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    label: Text(
      label,
      style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Arimo',
          color: Colors.white,
          letterSpacing: 1),
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 2, vertical: -4),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

class ChipContainer extends StatelessWidget {
  final String titulo;
  final String promedio;
  final Color color;

  ChipContainer({
    required this.titulo,
    required this.promedio,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 8,
      ),
      width: 100,
      height: 80,
      decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(1, 3),
              blurRadius: 3.5,
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
         children: [
        Text(
          titulo,
          style: TextStyle(
            fontFamily: 'Mitr',
            fontSize: 14,
            height: 1,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          promedio,
          style: TextStyle(
            fontFamily: 'Mitr',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
