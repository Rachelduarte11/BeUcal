import 'package:becertus_proyecto/Students/models/colors.dart';
import 'package:flutter/material.dart';

Widget chipData(String label, int color) {
  return Chip(
    backgroundColor: Color(color),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    label: Text(
      label,
      style: const TextStyle(
        fontSize: 12,
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
  final LinearGradient gradient;
  final bool isSelected;



  ChipContainer({
    required this.titulo,
    required this.promedio,
    required this.gradient,
    this.isSelected= false,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 0,
        left: 8,
      ),
      width: 85,
      height: 60,
      decoration: BoxDecoration(
         gradient: isSelected ? LinearGradient(colors: [redStatic, redStatic]) : gradient,
        
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(1, 3),
              blurRadius: 3.5,
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontFamily: 'Mitr',
                fontSize: 12,
                height: 1,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              promedio,
              style: TextStyle(
                fontFamily: 'Mitr',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
              ),
            )
          ]),
    );
  }
}
