// import 'dart:ffi';

import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
// import 'package:clima_flutter/utilities/constants.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'card.dart';
import 'card2.dart';
// import 'package:clima_flutter/services/location.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CityScreen extends StatefulWidget {
  @override
  const CityScreen({this.locationForecast});

  final locationForecast;

  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  // String? date1, date2, date3, date4;
  String? date1, date2, date3, date4;
  double? temp1, temp2, temp3, temp4;
  String? month1, month2, month3, month4;
  String? message;
  String? weatherCondition;
  int? n;

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();

    Update(widget.locationForecast);
  }

  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  String? sub(String? s) {
    s = s?.substring(8, 11);

    return s;
  }

  String? mon(String? s) {
    s = s?.substring(6, 7);
    // print(s);
    return month[(int.parse(s.toString())) - 1];
    // return month.length;
  }

  // double? nullcheck(double? t) {
  //   if (t == null) {
  //     t = 1.0;
  //   }
  //   return t;
  // }

  void Update(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        // print("Yay i am here");

        message = 'unable to detect location';
        return;
      } else {
        date1 = sub((weatherData['list'][0]['dt_txt']));
        date2 = sub((weatherData['list'][8]['dt_txt']));
        date3 = sub((weatherData['list'][16]['dt_txt']));
        date4 = sub((weatherData['list'][24]['dt_txt']));
        month1 = mon((weatherData['list'][0]['dt_txt']));
        month2 = mon((weatherData['list'][8]['dt_txt']));
        month3 = mon((weatherData['list'][16]['dt_txt']));
        month4 = mon((weatherData['list'][24]['dt_txt']));
        temp1 = (weatherData['list'][0]['main']['temp']);

        temp2 = (weatherData['list'][8]['main']['temp']);
        temp3 = (weatherData['list'][16]['main']['temp']);
        temp4 = (weatherData['list'][24]['main']['temp']);
        // String? newdate = date1;
        // temp1 = nullcheck(temp1);
        // print(temp1);
        // temp2 = nullcheck(temp2);
        // temp3 = nullcheck(temp3);
        // temp4 = nullcheck(temp4);

        weatherCondition = weatherData['list'][1][1];
        print("yay i m here");
        // print(mon(newdate));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 67),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 255, 67),
              Color.fromARGB(255, 255, 235, 50),
              Color.fromARGB(255, 255, 230, 40),
              Color.fromARGB(255, 255, 220, 30),
              Color.fromARGB(255, 255, 200, 20),
              Color.fromARGB(255, 255, 180, 0),
            ])),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_circle_left,
                    color: Color.fromARGB(255, 1, 0, 1),
                    size: 35.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 67),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: kInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Weather Forecast",
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 0, 1),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Animate(
                    effects: [
                      FadeEffect(),
                      SlideEffect(),
                    ],
                    child: Icon(
                      Icons.arrow_right_alt,
                      size: 40.0,
                      color: Color.fromARGB(255, 1, 0, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              // TextButton(
              //     onPressed: () async {
              //       var weatherData = await weather.getForecast(4);
              //       Update(weatherData);
              //     },
              //     child: const Icon(
              //       Icons.refresh,
              //       size: 40.0,
              //       color: Color.fromARGB(255, 1, 0, 1),
              //     )),
              // forecast(temp: temp?[0], date: date?[0]),
              SizedBox(
                  height: 200,
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      forecast(temp: temp1, date: date1, month: month1),
                      forecast(temp: temp2, date: date2, month: month2),
                      forecast(temp: temp3, date: date3, month: month3),
                      forecast(temp: temp4, date: date4, month: month4),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
