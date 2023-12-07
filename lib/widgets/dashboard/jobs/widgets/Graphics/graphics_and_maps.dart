import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/analisis_datos.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/analisis_inventario.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/asistente.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/rrhh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


//Se guardan Datos de los futuros trabajos en lista y mapas que funcionan de
// forma dinamica para los diferentes puestos laborales
class MovingAvatar extends StatefulWidget {
    final List<JobInfo> jobList;
  final int initialIndex;

  const MovingAvatar({
    Key? key,
    required this.jobList,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _MovingAvatarState createState() => _MovingAvatarState();
}

class _MovingAvatarState extends State<MovingAvatar> {
   late double _pointerValue;

  late String photoUrl;

   @override
  void initState() {
    super.initState();
    _pointerValue = widget.jobList[widget.initialIndex].progressValue;
    photoUrl = '';
  }
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
            width: MediaQuery.of(context).size.width * 0.75,
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
           // margin: const EdgeInsets.only(top: 10),
            child: Text(
              '${_pointerValue.toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Mitr',
                color: Color(0xff0BB49D),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
//Clase para las competencias (PODER COLOCAR EL NOMBRE Y PORCENTAJE DE LA COMPETENCIA)
class Competency {
  final String name;
  final double percentage;
  final Color color;

  Competency({
    required this.name,
    required this.percentage,
    required this.color,
  });
}
class JobInfo {
  final String textFutureJob;
  final double progressValue;
  final String pathImages;
  final Widget pageJob;
  final String documentId;
    final String description;
  final String careerTrends;
  final String responsibilities;
  final List<Competency> competencies;

  JobInfo({
    required this.textFutureJob,
    required this.progressValue,
    required this.pathImages,
    required this.pageJob,
    required this.documentId,
    required this.description,
    required this.careerTrends,
    required this.responsibilities,
    required this.competencies,
  });
}
final List<JobInfo> jobList = [
  JobInfo(
    textFutureJob: 'Analista de Inventario y abastecimiento',
    progressValue: 90,
    pathImages: 'assets/images/jobs/analista-inventario.png',
    pageJob: AnalisisInventario(),
    documentId: 'analista de inventario y abastecimiento',
    description: '''Un analista de inventarios y abastecimiento es responsable de gestionar y optimizar los niveles de inventario de una organización. Trabaja en estrecha colaboración con diferentes departamentos, como compras, logística y producción, para garantizar que la empresa tenga los productos necesarios para satisfacer la demanda del mercado. Esto implica monitorear el inventario actual, prever necesidades futuras y coordinar la reposición de existencias.''',
    careerTrends: '''
En un entorno empresarial dinámico, los analistas de inventarios y abastecimiento están adoptando tecnologías avanzadas, como sistemas de gestión de inventarios automatizados y análisis de datos en tiempo real. La capacidad de implementar estrategias de cadena de suministro eficientes y sostenibles también se ha vuelto crucial. Además, la globalización y las cadenas de suministro internacionales han ampliado las oportunidades para profesionales en este campo.
''',
    responsibilities: '''
          Gestión de Inventarios
          Análisis de Demanda
          Coordinación de Abastecimiento
          Optimización de la Cadena de Suministro
          Uso de Tecnología
          Negociación
          ''',
     competencies: [
      Competency(name: 'Competencia 1', percentage: 20, color: ColorConstants.color1),
      Competency(name: 'Competencia 2', percentage: 50, color:ColorConstants.color2),
      Competency(name: 'Competencia 3', percentage: 30, color:ColorConstants.color3),
      Competency(name: 'Competencia 4', percentage: 60, color:ColorConstants.color4),
      Competency(name: 'Competencia 5', percentage: 40, color:ColorConstants.color5),
    ],     
  ),
  JobInfo(
    textFutureJob: 'Asistente de consultorías',
    progressValue: 50,
    pathImages: 'assets/images/jobs/asistente.png',
    pageJob: Asistente(),
    documentId: 'Asistente de consultorías',
    description: '''Un asistente de consultoría desempeña un papel de apoyo clave en proyectos de consultoría, proporcionando asistencia administrativa y técnica. Trabaja estrechamente con consultores y clientes para garantizar la ejecución exitosa de proyectos. Sus responsabilidades incluyen la recopilación y análisis de datos, la preparación de informes, la coordinación de actividades y la comunicación efectiva entre todas las partes involucradas.''',
    careerTrends: '''La digitalización y el uso de tecnologías de información para la gestión de proyectos son tendencias significativas en el campo de la consultoría. Los asistentes de consultoría también pueden estar involucrados en la implementación de herramientas de colaboración en línea y plataformas de gestión de proyectos. La capacidad de adaptarse rápidamente a nuevas tecnologías y comprender las dinámicas empresariales es esencial.''',
    responsibilities: '''
          Soporte Administrativo
          Investigación
          Coordinación de Proyectos
          Comunicación
          Desarrollo de Presentaciones
          Seguimiento de Tareas
          ''',
          competencies: [
      Competency(name: 'Competencia 1', percentage: 80, color: ColorConstants.color1),
      Competency(name: 'Competencia 2', percentage: 90, color:ColorConstants.color2),
      Competency(name: 'Competencia 3', percentage: 80, color:ColorConstants.color3),
      Competency(name: 'Competencia 4', percentage: 90, color:ColorConstants.color4),
      Competency(name: 'Competencia 5', percentage: 90, color:ColorConstants.color5),
    ],
  ),
  JobInfo(
    textFutureJob: 'Analista de datos',
    progressValue: 30,
    pathImages: 'assets/images/jobs/analista-datos.png',
    pageJob: AnalisisDatos(),
    documentId: 'asistente de consultorias',
    description:      '''Un analista de datos es un profesional especializado en interpretar y analizar conjuntos de datos para extraer información valiosa y respaldar la toma de decisiones. Utiliza herramientas y técnicas estadísticas, así como habilidades en programación y visualización de datos, para identificar patrones, tendencias y conocimientos clave.Los analistas de datos trabajan en diversos sectores, desde negocios y finanzas hasta salud y tecnología, colaborando con equipos para resolver problemas específicos, mejorar procesos y optimizar estrategias empresariales.''',
    careerTrends:       '''Con la creciente importancia de los datos en el mundo empresarial, la demanda de analistas de datos está en aumento. Se espera que la profesión continúe siendo clave en la toma de decisiones estratégicas y el desarrollo de soluciones innovadoras en diversas industrias. La capacitación continua en nuevas tecnologías y técnicas de análisis de datos es esencial para mantenerse relevante en este campo en constante evolución.''',
    responsibilities: '''
          Recopilación de Datos
          Análisis Estadístico
          Modelado de Datos
          Visualización de Datos
          Informes y Presentaciones
          Colaboración
          ''',
        competencies: [
      Competency(name: 'Competencia 1', percentage: 80, color: ColorConstants.color1),
      Competency(name: 'Competencia 2', percentage: 90, color:ColorConstants.color2),
      Competency(name: 'Competencia 3', percentage: 80, color:ColorConstants.color3),
      Competency(name: 'Competencia 4', percentage: 90, color:ColorConstants.color4),
      Competency(name: 'Competencia 5', percentage: 90, color:ColorConstants.color5),
    ],
  ),
  JobInfo(
    textFutureJob: 'Especialista en RR.HH',
    progressValue: 20,
    pathImages: 'assets/images/jobs/rrhh.png',
    pageJob: RRHH(),
    documentId: 'rrhh',
    description: '''Un especialista en Recursos Humanos es responsable de gestionar diversas funciones relacionadas con el capital humano dentro de una organización. Esto incluye la contratación, la gestión del desempeño, la capacitación y desarrollo, la administración de beneficios y la resolución de problemas relacionados con el personal. Además, juega un papel fundamental en la creación y mantenimiento de un ambiente laboral saludable y productivo.''',
    careerTrends: '''En la actualidad, las tendencias en Recursos Humanos incluyen el enfoque en la experiencia del empleado, la incorporación de tecnologías de gestión de recursos humanos, el énfasis en la diversidad e inclusión, y la adaptación a modelos de trabajo flexibles, como el trabajo remoto. Los especialistas en RRHH también están cada vez más involucrados en la gestión del cambio y el desarrollo de estrategias para retener y atraer talento.''',
    responsibilities: '''
          Reclutamiento y Selección
          Gestión del Desempeño
          Capacitación y Desarrollo
          Administración de Beneficios
          Gestión de Conflictos
          Cumplimiento Normativo
''',
   competencies: [
      Competency(name: 'Competencia 1', percentage: 80, color: ColorConstants.color1),
      Competency(name: 'Competencia 2', percentage: 90, color:ColorConstants.color2),
      Competency(name: 'Competencia 3', percentage: 80, color:ColorConstants.color3),
      Competency(name: 'Competencia 4', percentage: 90, color:ColorConstants.color4),
      Competency(name: 'Competencia 5', percentage: 90, color:ColorConstants.color5),
    ],
  ),
];
class DetailsButton extends StatelessWidget {
  final int selectedIndex;

  const DetailsButton({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    NotasProvider notasProvider = Provider.of<NotasProvider>(context);
    String? photoUrlJob = notasProvider.photoUrlJob;
    JobInfo selectedJob = jobList[selectedIndex];
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: MediaQuery.of(context).size.width*0.95,
          height: MediaQuery.of(context).size.height*0.95,
          decoration: BoxDecoration(
              color: const Color(0XFFF5F5F5),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(62, 133, 132, 132),
                  offset: Offset(1, 1),
                  blurRadius: 3.5,
                ),
              ],
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                 // padding: EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                  child: Image.network(photoUrlJob??'', fit: BoxFit.cover,)),
              ),
              SizedBox(height: 5,),
              Text(
                selectedJob.description,
                style: TextStyle(fontSize: 12, color: Color(0xff323232),),
              ),
              const SizedBox(height: 8,),
              const Text(
                  'Responsabilidades Típicas',
                  style: TextStyle(fontSize: 16, color: Color(0xff323232),  fontFamily: 'Mitr'),
                ),
               Text(selectedJob.responsibilities,
                style: TextStyle(fontSize: 14, color: Color(0xff323232), fontFamily: 'Arimo'),
              ),
              //const SizedBox(height: 3,),
              const Text(
                  'Tendencias de Carrera',
                  style: TextStyle(fontSize: 16, color: Color(0xff323232), fontFamily: 'Mitr'),
                ),
               Center(
                child: Text(
                  selectedJob.careerTrends,
                  style: TextStyle(fontSize: 12, color: Color(0xff323232)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DonutChartGen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobInfo = jobList[0]; // Tomamos el primer elemento como ejemplo
    final averageData = calculateAverage(jobInfo.competencies);

    final _chartData = getChartData(jobInfo.competencies);
    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<GDPData, dynamic>(
          dataSource: _chartData,
          innerRadius: '50%',
          explode: true,
          explodeOffset: '10%',
          dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              textStyle: TextStyle(color: Colors.white, fontSize: 16)),
          xValueMapper: (GDPData data, _) => data.course,
          yValueMapper: (GDPData data, _) => data.value,
          pointColorMapper: (GDPData data, _) => data.color,
        ),
      ],
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          widget: Center(
            child: Text(
              averageData.toStringAsFixed(0) + '%',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<GDPData> getChartData(List<Competency> competencies) {
     return competencies.map((competency) {
      return GDPData(competency.name, competency.percentage, competency.color);
    }).toList();
  }
   double calculateAverage(List<Competency> competencies) {
    if (competencies.isEmpty) {
      return 0.0;
    }

    final totalPercentage = competencies
        .map((competency) => competency.percentage)
        .reduce((value, element) => value + element);

    return totalPercentage / competencies.length;
  }
}

class GDPData {
  GDPData(this.course, this.value, this.color);
  final String course;
  final double value;
  final Color color;
}

class ColorConstants {
  static const Color color1 = Color(0xffBBC700);
  static const Color color2 = Color.fromARGB(255, 106, 193, 0);
  static const Color color3 = Color(0xff09806F);
  static const Color color4 = Color(0xffFF6B6B);
  static const Color color5 = Color.fromARGB(225, 248, 178, 37);
}
