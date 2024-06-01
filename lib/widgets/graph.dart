import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        scatterSpots: [
          _dot(x: 5, y: 5, size: 10, color: Colors.red.withOpacity(0.5)),
          _dot(x: 2, y: 8, size: 5, color: Colors.blue.withOpacity(0.5)),
        ],
        gridData: const FlGridData(horizontalInterval: 5, verticalInterval: 5),
        scatterTouchData: ScatterTouchData(
          enabled: false,
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            axisNameWidget: _title(title: 'Importance'),
          ),
          bottomTitles: AxisTitles(
            axisNameWidget: _title(title: 'Satisfaction'),
          ),
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
        ),
        minY: 0,
        maxY: 10,
        minX: 0,
        maxX: 10,
      ),
    );
  }

  Widget _title({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('Low'),
        ),
        Text(title.toUpperCase()),
        const Text('High')
      ],
    );
  }

  ScatterSpot _dot(
      {required double x, required double y, required double size, required Color color}) {
    return ScatterSpot(x, y, dotPainter: FlDotCirclePainter(radius: size * 10, color: color));
  }
}
