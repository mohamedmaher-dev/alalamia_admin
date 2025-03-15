// part of '../statistics_view.dart';

// class _BarChart extends StatelessWidget {
//   const _BarChart({required this.data});
//   final StatisticsResponseModel data;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: BarChart(
//         BarChartData(
//           titlesData: FlTitlesData(
//             show: true,
//             rightTitles: const AxisTitles(
//               sideTitles: SideTitles(showTitles: false),
//             ),
//             topTitles: const AxisTitles(
//               sideTitles: SideTitles(showTitles: false),
//             ),
//             bottomTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 getTitlesWidget: bottomTitles,
//                 reservedSize: 50,
//               ),
//             ),
//             leftTitles: AxisTitles(
//               sideTitles: SideTitles(
//                 showTitles: true,
//                 interval: 2,
//                 getTitlesWidget: (value, meta) => leftTitles(value, meta, data),
//               ),
//             ),
//           ),
//           borderData: FlBorderData(show: false),
//           barGroups: makeGroupDataTest(data),
//           gridData: const FlGridData(show: true),
//         ),
//       ),
//     );
//   }

//   Widget leftTitles(
//     double value,
//     TitleMeta meta,
//     StatisticsResponseModel data,
//   ) {
//     final style = TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp);
//     return SideTitleWidget(
//       meta: meta,
//       space: 0,
//       child: Text(value.toInt().toString(), style: style),
//     );
//   }

//   Widget bottomTitles(double value, TitleMeta meta) {
//     final titles = data.chartLabels!.days;

//     final Widget text = Text(
//       titles[value.toInt()],
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
//     );

//     return SideTitleWidget(
//       meta: meta,
//       space: 16, //margin top
//       child: text,
//     );
//   }

//   List<BarChartGroupData> makeGroupDataTest(StatisticsResponseModel data) {
//     final width = 5.w;
//     return List.generate(
//       data.chartLabels!.days.length,
//       (index) => BarChartGroupData(
//         barsSpace: 1,
//         x: index,
//         barRods: [
//           // Requests
//           BarChartRodData(
//             toY: data.data!.requests![0][index].toDouble(),
//             color: ColorManger.myGold,
//             width: width,
//           ),
//           // Approved
//           BarChartRodData(
//             toY: data.data!.approved![0][index].toDouble(),
//             color: ColorManger.green,
//             width: width,
//           ),
//           // Canceled
//           BarChartRodData(
//             toY: data.data!.canceled![0][index].toDouble(),
//             color: ColorManger.red,
//             width: width,
//           ),
//         ],
//       ),
//     );
//   }
// }
