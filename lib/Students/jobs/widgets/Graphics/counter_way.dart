import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MovingAvatar extends StatefulWidget {
  const MovingAvatar({Key? key}) : super(key: key);

  @override
  _MovingAvatarState createState() => _MovingAvatarState();
}

class _MovingAvatarState extends State<MovingAvatar> {
  final double _pointerValue = 80;

  late String photoUrl = '';

  @override
  void didChangeDependencies() {
    final NotasProvider notasProvider =
        Provider.of<NotasProvider>(context, listen: false);
    precacheImage(NetworkImage(notasProvider.photoUrl ?? ''), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    NotasProvider notasProvider = Provider.of<NotasProvider>(context);
    photoUrl = notasProvider.photoUrl?? '';
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        child: _buildMovingAvatar(context),
      ),
    );
  }

  Widget _buildMovingAvatar(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final NotasProvider notasProvider =
        Provider.of<NotasProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            child: SfLinearGauge(
              maximum:100.0,
              interval: 100.0,
              animateAxis: true,
              
              minorTicksPerInterval: 0,
              axisTrackStyle: LinearAxisTrackStyle(
                thickness: 25,
                borderWidth: 1,
              
                borderColor: brightness == Brightness.dark
                    ? const Color(0xff898989)
                    : Colors.grey[350],
                color: brightness == Brightness.light
                    ? const Color(0xffE8EAEB)
                    : const Color(0xff62686A),
              ),
              barPointers: <LinearBarPointer>[
                LinearBarPointer(
                  
                  value: _pointerValue,
                  animationDuration: 3000,
                  thickness: 25,
                  color: const Color(0xff0BB49D),
                ),
                LinearBarPointer(
                  value: 80,
                  enableAnimation: false,
                  thickness: 25,
                  offset: 60,
                  color: Colors.transparent,
                  position: LinearElementPosition.outside,
                ),
              ],
              markerPointers: <LinearMarkerPointer>[
                LinearWidgetPointer(
                  value: _pointerValue,
                  animationDuration: 2800,
                  onAnimationCompleted: () {
                    photoUrl = notasProvider.photoUrl ?? '';
                  },
                  position: LinearElementPosition.outside,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          photoUrl), // Establecer la imagen de fondo
                      radius:
                          40, // Puedes ajustar el tamaño según tus necesidades
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 65),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
                Text(
                  _pointerValue.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xff0BB49D),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
