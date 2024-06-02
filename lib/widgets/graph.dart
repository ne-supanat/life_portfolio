import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/index_bloc.dart';
import '../global/constants/life_unit_keys.dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LifeBloc, LifeModel>(builder: (context, value) {
      return ScatterChart(
        ScatterChartData(
          scatterSpots: value.life
              .map(
                (key, value) => MapEntry(
                    key,
                    _dot(
                        x: value.satisfaction.toDouble(),
                        y: value.importance.toDouble(),
                        size: value.timeSpend.toDouble(),
                        color: key.area.color.withOpacity(0.5))),
              )
              .values
              .toList(),
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
    });
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
    return ScatterSpot(x, y, dotPainter: FlDotCirclePainter(radius: (size + 1) * 10, color: color));
  }
}
