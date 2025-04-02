import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../../utils/Colors.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text("Estadísticas"),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Estadísticas de Producción",
              style: TextStyle(fontSize: 22, color: AppColors.fifthColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  backgroundColor: AppColors.primaryColor,
                  barGroups: _getBarGroups(),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text("Lun", style: TextStyle(color: AppColors.fifthColor));
                            case 1:
                              return const Text("Mar", style: TextStyle(color: AppColors.fifthColor));
                            case 2:
                              return const Text("Mié", style: TextStyle(color: AppColors.fifthColor));
                            case 3:
                              return const Text("Jue", style: TextStyle(color: AppColors.fifthColor));
                            case 4:
                              return const Text("Vie", style: TextStyle(color: AppColors.fifthColor));
                            case 5:
                              return const Text("Sáb", style: TextStyle(color: AppColors.fifthColor));
                            case 6:
                              return const Text("Dom", style: TextStyle(color: AppColors.fifthColor));
                            default:
                              return const Text("");
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    List<double> valores = [10, 15, 8, 12, 20, 18, 14]; // Datos de ejemplo
    return List.generate(valores.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: valores[index],
            color: AppColors.fifthColor,
            width: 16,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      );
    });
  }
}

