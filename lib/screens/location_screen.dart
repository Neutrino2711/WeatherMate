import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/weather.dart';
import 'city_screen.dart';
import 'card.dart';

class LocationScreen extends StatefulWidget {
  @override
  LocationScreen({this.locationWeather});

  final locationWeather;

  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temp;
  String? weatherIcon;
  String? cityName;
  String? message;
  num? wind;
  int? humidity;
  int? visibility;

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
    // getLocationForecast();
  }

  //   getLocationForecast() async {
  //   // print("check");
  //   var weatherData = await WeatherModel().getLocationWeather();
  //   // print("check");
  //   return Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return LocationScreen(locationWeather: weatherData);
  //       },
  //     ),
  //   );
  // }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        message = 'unable to detect location';
        weatherIcon = 'error';
        cityName = '';
        return;
      }
      double? temperature = weatherData['main']['temp'];
      temp = temperature?.toInt();
      message = weather.getMessage(temp!.toInt());
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      wind = weatherData['wind']['speed'];
      humidity = (weatherData['main']['humidity']);
      visibility = weatherData['visibility'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 66, 197, 255),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 66, 197, 255),
              Color.fromARGB(255, 66, 150, 255),
              Color.fromARGB(255, 66, 130, 255),
              Color.fromARGB(255, 66, 120, 255),
              Color.fromARGB(255, 66, 110, 255),
              Color.fromARGB(255, 66, 100, 255),
              Color.fromARGB(255, 30, 70, 255)
            ])),
        // decoration: BoxDecoration(
        //   // image: DecorationImage(
        //   //   image: AssetImage('images/location_background.jpg'),
        //     // fit: BoxFit.cover,
        //     // colorFilter: ColorFilter.mode(
        //     //     Colors.white.withOpacity(0.8), BlendMode.dstATop),
        //   ),

        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                        // print(weatherData[cityName]);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                        color: Color.fromARGB(255, 1, 0, 1),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var forecastData = await WeatherModel().getForecast(4);
                        var typedName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CityScreen(
                            locationForecast: forecastData,
                          );
                        }));
                        if (typedName != null) {
                          // print("check");
                          var weatherData =
                              await weather.getCityWeather(typedName);
                          updateUI(weatherData);
                          // print(weatherData[cityName]);
                        }
                      },
                      // child: Container(
                      //   height: 200.0,
                      //   width: 200.0,
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(colors: [
                      //     Colors.red,
                      //     Colors.redAccent,
                      //     Colors.orange,
                      //     Colors.yellow,
                      //     Colors.green,
                      //   ])),
                      //   child: Text("Check"),
                      // )
                      child: Icon(
                        Icons.add_location_alt,
                        size: 50.0,
                        color: Color.fromARGB(255, 1, 0, 1),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$temp°',
                        style: kTempTextStyle,
                      ),
                      // Text(
                      //   weatherIcon.toString(),
                      //   style: kConditionTextStyle,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "${message.toString()} in $cityName",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                card(
                  humidity: humidity,
                  wind: wind,
                  visibility: visibility,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
