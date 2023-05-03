import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/weather.dart';
// import 'dart:html';

WeatherModel weather = WeatherModel();

// class forecast extends StatefulWidget {
//   forecast({this.forecasttemp, this.forecastmonth, this.forecastdate});
//   final forecasttemp, forecastmonth, forecastdate;
//   @override
//   State<forecast> createState() => _forecastState();
// }

// class _forecastState extends State<forecast> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class forecast extends StatelessWidget {
  const forecast({this.temp, this.date, this.month});

  final double? temp;
  final String? date;
  final String? month;
  // final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      height: 140.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(temp.toString(), style: kforecastTextStyle),
          weather.getIcon(temp!),
          Text(date.toString(), style: kforecastTextStyle),
          Text(month.toString(), style: kforecastTextStyle),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.0,
          style: BorderStyle.solid,
          color: Color.fromARGB(255, 1, 0, 1),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
  // return Container(
  //     height: 200,
  //     width: 350,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         cell(),
  //         cell(),
  //         cell(),
  //         cell(),
  //       ],
  //     ));
}
