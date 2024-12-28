
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


List<Color> gradientColors = [const Color(0xFFFFC107)];

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 0.1,
          );
        }),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitlesWidget: (value, meta) {
            TextStyle style = const TextStyle(
              color: Color(0xff68737d),
              fontSize: 12,
            );

            switch (value.toInt()) {
              case 2:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0), // Apply margin with padding
                  child: Text('1', style: style),
                );
              case 5:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('11', style: style),
                );
              case 8:
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('21', style: style),
                );
              default:
                return const SizedBox.shrink(); // No title for other values
            }
          },
        ),
      ),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              TextStyle style = const TextStyle(
                color: Color(0xff67727d),
                fontSize: 12,
              );

              switch (value.toInt()) {
                case 1:
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0), // Apply padding as margin
                    child: Text('10k', style: style),
                  );
                case 3:
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text('50k', style: style),
                  );
                case 5:
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text('100k', style: style),
                  );
                default:
                  return const SizedBox.shrink(); // No title for other values
              }
            },
            reservedSize: 28,
          ),
        ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          const FlSpot(0, 3),
          const FlSpot(2.6, 2),
          const FlSpot(4.9, 5),
          const FlSpot(6.8, 3.1),
          const FlSpot(8, 4),
          const FlSpot(9.5, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,
        color: gradientColors[0],
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
