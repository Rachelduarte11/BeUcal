import 'package:becertus_proyecto/widgets/dashboard/global/range_jobs.dart';
import 'package:flutter/material.dart';

class AverageFutureJob extends StatefulWidget {
  const AverageFutureJob({Key? key,
    required this.textFutureJob,
    required this.progressValue,}):super(key: key);


 final String textFutureJob;
  final double progressValue;

  @override
  State<AverageFutureJob> createState() => _AverageFutureJobState();
}

class _AverageFutureJobState extends State<AverageFutureJob> {
  bool showAlternateContent = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.only(right: 10, bottom: 12),
      height: 80,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(boxShadow: [
        const BoxShadow(
          color: Color(0x3f000000),
          offset: Offset(1, 1),
          blurRadius: 3.5,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: showAlternateContent ? buildAlternateContent('Texto1') : buildDefaultContent()   );
  }

  Widget buildDefaultContent() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showAlternateContent = true;
        });
      },
      child: Row(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
            child: ProgressBarDeterminateStyle(
              progressValue: widget.progressValue,
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.50,
          child: Text(
            widget.textFutureJob,
            style: TextStyle(fontSize: 18, color: Color(0xff323232)),
          ),
        ),
        Icon(Icons.arrow_forward_ios_rounded)
      ]),
    );
  }

  Widget buildAlternateContent(String alternateText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showAlternateContent = false;
        });
      },
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.50,
            child: Text(
              alternateText,
              style: TextStyle(fontSize: 18, color: Color(0xff323232)),
            ),
          ),
          Icon(Icons
              .arrow_back_ios_rounded), // Cambiar a la flecha hacia la izquierda
        ],
      ),
    );
  }
}
