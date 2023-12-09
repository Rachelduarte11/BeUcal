import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarTrackerSimplified extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        minimum: 0,
        maximum: 100,
        majorTickLines: const MajorTickLines(size: 0),
      ),
      series: <BarSeries<ChartSampleData, String>>[
        BarSeries<ChartSampleData, String>(
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'Item 1', y: 75, color: Color(0xFF08806F)),
            ChartSampleData(x: 'Item 2', y: 70, color: Color(0xFF00C1A7)),
            ChartSampleData(x: 'Item 3', y: 35, color: Color(0xFF44DECC)),
            ChartSampleData(x: 'Item 4', y: 65, color: Color(0xFF9BFFF3)),
         
          ],
          borderRadius: BorderRadius.circular(5),
          width: 0.5,
          trackColor: const Color.fromRGBO(198, 201, 207, 1),
          isTrackVisible: true,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
          ),
          pointColorMapper:(ChartSampleData sales, _) => sales.color,
          xValueMapper: (ChartSampleData sales, _) => sales.x as String,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
        ),
      ],
    );
  }
}

class ChartSampleData {
  ChartSampleData({required this.x, required this.y, required this.color});
  final Color color;
  final String x;
  final double y;
}
