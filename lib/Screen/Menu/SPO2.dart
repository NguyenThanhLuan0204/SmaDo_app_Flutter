//
// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:graphic/graphic.dart';
// import 'package:quiver/iterables.dart';
// class Analytics extends StatefulWidget {
//   const Analytics({Key? key}) : super(key: key);
//
//   @override
//   State<Analytics> createState() => _AnalyticsState();
// }
//
// class _AnalyticsState extends State<Analytics> {
//   // var lineMarkerData = [
//   // {'month': 'JAN', 'value': 40},
//   // {'month': 'FEB', 'value': 70},
//   // {'month': 'MAR', 'value': 20},
//   // {'month': 'APR', 'value': 90},
//   // {'month': 'MAY', 'value': 36},
//   // {'month': 'JUN', 'value': 80},
//   // {'month': 'JUL', 'value': 30},
//   // {'month': 'AUG', 'value': 90},
//   // {'month': 'SEP', 'value': 20},
//   // {'month': 'NOV', 'value': 70},
//   // {'month': 'DEC', 'value': 100},
//   // ];
//   var lineSectionsData = [
//     [
//       '00:00',
//       '01:15',
//       '02:30',
//       '03:45',
//       '05:00',
//       '06:15',
//       '07:30',
//       '08:45',
//       '10:00',
//       '11:15',
//       '12:30',
//       '13:45',
//       '15:00',
//       '16:15',
//       '17:30',
//       '18:45',
//       '20:00',
//       '21:15',
//       '22:30',
//       '23:45'
//     ],
//     [
//       300,
//       280,
//       250,
//       260,
//       270,
//       300,
//       550,
//       500,
//       400,
//       390,
//       380,
//       390,
//       400,
//       500,
//       600,
//       750,
//       800,
//       700,
//       600,
//       400
//     ],
//   ];
// var lineMarkerData = [
//   {'day': 'Mon', 'value': 10, 'group': 'Highest'},
//   {'day': 'Tue', 'value': 11, 'group': 'Highest'},
//   {'day': 'Wed', 'value': 13, 'group': 'Highest'},
//   {'day': 'Thu', 'value': 11, 'group': 'Highest'},
//   {'day': 'Fri', 'value': 12, 'group': 'Highest'},
//   {'day': 'Sat', 'value': 12, 'group': 'Highest'},
//   {'day': 'Sun', 'value': 9, 'group': 'Highest'},
//   {'day': 'Mon', 'value': 1, 'group': 'Lowest'},
//   {'day': 'Tue', 'value': -2, 'group': 'Lowest'},
//   {'day': 'Wed', 'value': 2, 'group': 'Lowest'},
//   {'day': 'Thu', 'value': 5, 'group': 'Lowest'},
//   {'day': 'Fri', 'value': 3, 'group': 'Lowest'},
//   {'day': 'Sat', 'value': 2, 'group': 'Lowest'},
//   {'day': 'Sun', 'value': 0, 'group': 'Lowest'},
// ];
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       margin: const EdgeInsets.only(top: 10),
//       width: 350,
//       height: 300,
//       child: Chart(
//         data: lineMarkerData,
//         variables: {
//           'day': Variable(
//             accessor: (Map datum) => datum['day'] as String,
//             scale: OrdinalScale(inflate: true),
//           ),
//           'value': Variable(
//             accessor: (Map datum) => datum['value'] as num,
//             scale: LinearScale(
//               max: 15,
//               min: -3,
//               tickCount: 7,
//               formatter: (v) => '${v.toInt()} ℃',
//             ),
//           ),
//           'group': Variable(
//             accessor: (Map datum) => datum['group'] as String,
//           ),
//         },
//         elements: [
//           LineElement(
//             position:
//             Varset('day') * Varset('value') / Varset('group'),
//             color: ColorAttr(
//               variable: 'group',
//               values: [
//                 const Color(0xff5470c6),
//                 const Color(0xff91cc75),
//               ],
//             ),
//           ),
//         ],
//         axes: [
//           Defaults.horizontalAxis,
//           Defaults.verticalAxis,
//         ],
//         selections: {
//           'tooltipMouse': PointSelection(on: {
//             GestureType.hover,
//           }, devices: {
//             PointerDeviceKind.mouse
//           }, variable: 'day', dim: Dim.x),
//           'tooltipTouch': PointSelection(on: {
//             GestureType.scaleUpdate,
//             GestureType.tapDown,
//             GestureType.longPressMoveUpdate
//           }, devices: {
//             PointerDeviceKind.touch
//           }, variable: 'day', dim: Dim.x),
//         },
//         tooltip: TooltipGuide(
//           followPointer: [true, true],
//           align: Alignment.topLeft,
//           variables: ['group', 'value'],
//         ),
//         crosshair: CrosshairGuide(
//           followPointer: [false, true],
//         ),
//         annotations: [
//           LineAnnotation(
//             dim: Dim.y,
//             value: 11.14,
//             style: StrokeStyle(
//               color: const Color(0xff5470c6).withAlpha(100),
//               dash: [2],
//             ),
//           ),
//           LineAnnotation(
//             dim: Dim.y,
//             value: 1.57,
//             style: StrokeStyle(
//               color: const Color(0xff91cc75).withAlpha(100),
//               dash: [2],
//             ),
//           ),
//           MarkAnnotation(
//             relativePath:
//             Paths.circle(center: Offset.zero, radius: 5),
//             style: Paint()..color = const Color(0xff5470c6),
//             values: ['Wed', 13],
//           ),
//           MarkAnnotation(
//             relativePath:
//             Paths.circle(center: Offset.zero, radius: 5),
//             style: Paint()..color = const Color(0xff5470c6),
//             values: ['Sun', 9],
//           ),
//           MarkAnnotation(
//             relativePath:
//             Paths.circle(center: Offset.zero, radius: 5),
//             style: Paint()..color = const Color(0xff91cc75),
//             values: ['Tue', -2],
//           ),
//           MarkAnnotation(
//             relativePath:
//             Paths.circle(center: Offset.zero, radius: 5),
//             style: Paint()..color = const Color(0xff91cc75),
//             values: ['Thu', 5],
//           ),
//           TagAnnotation(
//             label: Label(
//                 '13',
//                 LabelStyle(
//                   style: Defaults.textStyle,
//                   offset: const Offset(0, -10),
//                 )),
//             values: ['Wed', 13],
//           ),
//           TagAnnotation(
//             label: Label(
//                 '9',
//                 LabelStyle(
//                   style: Defaults.textStyle,
//                   offset: const Offset(0, -10),
//                 )),
//             values: ['Sun', 9],
//           ),
//           TagAnnotation(
//             label: Label(
//                 '-2',
//                 LabelStyle(
//                   style: Defaults.textStyle,
//                   offset: const Offset(0, -10),
//                 )),
//             values: ['Tue', -2],
//           ),
//           TagAnnotation(
//             label: Label(
//                 '5',
//                 LabelStyle(
//                   style: Defaults.textStyle,
//                   offset: const Offset(0, -10),
//                 )),
//             values: ['Thu', 5],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:fit/models/analyticModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: sampleData1,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: sampleData2,
                builder: (context, snapshot1) {
                  if (snapshot1.hasData) {
                    return LineChart(
                      isShowingMainData ? snapshot.data! : snapshot1.data!,
                      swapAnimationDuration: const Duration(milliseconds: 250),
                    );
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                });
          } else
            return Center(
              child: const CircularProgressIndicator(),
            );
        });
  }

  Future<LineChartData> get sampleData1 async {
    return LineChartData(
      lineTouchData: lineTouchData1,
      gridData: gridData,
      titlesData: titlesData1,
      borderData: borderData,
      lineBarsData: await lineBarsData1,
      minX: 1,
      maxX: 12,
      maxY: 200,
      minY: 0,
    );
  }

  Future<LineChartData> get sampleData2 async => LineChartData(
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: await lineBarsData2,
    minX: 1,
    maxX: 12,
    maxY: 200,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  Future<List<LineChartBarData>> get lineBarsData1 async {
    return [
      await lineChartBarData1_2,

    ];
  }

  LineTouchData get lineTouchData2 => LineTouchData(
    enabled: false,
  );

  FlTitlesData get titlesData2 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  Future<List<LineChartBarData>> get lineBarsData2 async {
    return [

      await lineChartBarData2_2,

    ];
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 50:
        text = '50';
        break;
      case 100:
        text = '100';
        break;
      case 150:
        text = '150';
        break;
      case 200:
        text = '200';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1', style: style);
        break;
      case 2:
        text = const Text('2', style: style);
        break;
      case 3:
        text = const Text('3', style: style);
        break;
      case 4:
        text = const Text('4', style: style);
        break;
      case 5:
        text = const Text('5', style: style);
        break;
      case 6:
        text = const Text('6', style: style);
        break;
      case 7:
        text = const Text('7', style: style);
        break;
      case 8:
        text = const Text('8', style: style);
        break;
      case 9:
        text = const Text('9', style: style);
        break;
      case 10:
        text = const Text('10', style: style);
        break;
      case 11:
        text = const Text('11', style: style);
        break;
      case 12:
        text = const Text('12', style: style);
        break;

      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Colors.green, width: 4),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  Future<LineChartBarData> get lineChartBarData1_2 async {
    var spots = [
      const FlSpot(1.0, 0),
      const FlSpot(2.0, 0),
      const FlSpot(3.0, 0),
      const FlSpot(4.0, 0),
      const FlSpot(5, 0),
      const FlSpot(6, 0),
      const FlSpot(7, 0),
      const FlSpot(8, 0),
      const FlSpot(9, 0),
      const FlSpot(10, 0),
      const FlSpot(11, 0),
      const FlSpot(12, 0),
    ];
    var token = await FlutterSecureStorage().read(key: "token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST',
        Uri.parse('http://165.22.55.235:8080/api/v1/analytic/get_analytic'));
    request.body = json.encode({"ip_mac": "C8:C9:A3:54:F1:57"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = (await response.stream.bytesToString());
      print("data spo2" + data);
      GetAnalytic getAnalytic = GetAnalytic.fromJson(json.decode(data));
      for (int i = 0; i < getAnalytic.beatAvgs!.length; i++) {
        String monthString = getAnalytic.beatAvgs![i].month!;
        List<String> parts = monthString.split('/');
        int month = int.parse(parts[0]);
        spots[month - 1] = FlSpot(month.toDouble(), getAnalytic.beatAvgs![i].avg![1]);
      }
      // for (int i = 0; i < getAnalytic.beatAvgs!.length; i++) {
      //   double month =
      //       double.parse(getAnalytic.beatAvgs![i].month!.split('/')[0]);
      //   spots[int.parse(getAnalytic.beatAvgs![i].month!.split('/')[0])] = FlSpot(month, getAnalytic.beatAvgs![i].avg![1]);}
    } else {
      print("loi get spo2" + response.reasonPhrase.toString());
    }
    return LineChartBarData(
      isCurved: false,
      color: Colors.blue,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
        color: Colors.green,
      ),
      spots: spots,
    );
  }


  Future<LineChartBarData> get lineChartBarData2_2 async {
    var spots = [
      const FlSpot(01, 0),
      const FlSpot(02, 0),
      const FlSpot(03, 0),
      const FlSpot(04, 0),
      const FlSpot(05, 0),
      const FlSpot(06, 0),
      const FlSpot(07, 0),
      const FlSpot(08, 0),
      const FlSpot(09, 0),
      const FlSpot(10, 0),
      const FlSpot(11, 0),
      const FlSpot(12, 0),
    ];
    var token = await FlutterSecureStorage().read(key: "token");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST',
        Uri.parse('http://165.22.55.235:8080/api/v1/analytic/get_analytic'));
    request.body = json.encode({"ip_mac": "C8:C9:A3:54:F1:57"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = (await response.stream.bytesToString());
      print("data spo2" + data);
      GetAnalytic getAnalytic = GetAnalytic.fromJson(json.decode(data));
      for (int i = 0; i < getAnalytic.beatAvgs!.length; i++) {
        String monthString = getAnalytic.beatAvgs![i].month!;
        List<String> parts = monthString.split('/');
        int month = int.parse(parts[0]);
        spots[month - 1] = FlSpot(month.toDouble(), getAnalytic.beatAvgs![i].avg![1]);
      }
    } else {
      print("loi get spo2" + response.reasonPhrase.toString());
    }
    return LineChartBarData(
      isCurved: false,
      color: Colors.blue,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
        color: Colors.blue.withOpacity(0.75),
      ),
      spots: spots,
    );
  }

}

class SPO2 extends StatefulWidget {
  const SPO2({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<SPO2> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text(
              "SPO2",
              style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF5E135E),
                  fontWeight: FontWeight.bold),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.23,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 37,
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 6),
                        child: _LineChart(isShowingMainData: isShowingMainData),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                // IconButton(
                //   icon: Icon(
                //     Icons.refresh,
                //     color:
                //     Colors.red.withOpacity(isShowingMainData ? 1.0 : 0.5),
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       isShowingMainData = !isShowingMainData;
                //     });
                //   },
                // )
              ],
            ),
          ),
          const Center(
            child: Text(
              "Note",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF5E135E),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF5E135E)),
                borderRadius: const BorderRadius.all(Radius.circular(
                    5.0) //                 <--- border radius here
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: const SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: const Color(0xFF5E135E)),
                          borderRadius: const BorderRadius.all(Radius.circular(
                              5.0) //                 <--- border radius here
                          ),
                        ),
                      ),
                      const Text('SPO2')
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
