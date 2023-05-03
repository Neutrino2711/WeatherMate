// import 'dart:html';

import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart  ';
import 'package:clima_flutter/screens/loading_screen.dart';
import 'package:flutter/material.dart';

const apiKey = "44a05e126b967298a571aa4cb44d682c";
const openweatherapiURL = "https://api.openweathermap.org/data/2.5/weather";
const openforecastapiURL = "https://api.openweathermap.org/data/2.5/forecast";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "$openweatherapiURL?q=$cityName&appid=$apiKey&units=metric");
    // https://api.openweathermap.org/data/2.5/weather?lat=100.0&lon=89.99&appid=44a05e126b967298a571aa4cb44d682c&units=metric

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getForecast(int cnt) async {
    Location location = Location();
    await location.getcurrentLocation();
    print(location.latitude);

    NetworkHelper networkHelper = NetworkHelper(
        "${openforecastapiURL}?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}&units=metric");
    // https://api.openweathermap.org/data/2.5/forecast/daily?lat=22.9579999&lon=88.4300424&cnt=4&appid=44a05e126b967298a571aa4cb44d682c&units=metric

    var weatherData = await networkHelper.getData();
    // print("check");
    print(weatherData);
    print(weatherData['cnt']);
    // print("check");
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getcurrentLocation();
    print("check");

    NetworkHelper networkHelper = NetworkHelper(
        '$openweatherapiURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    print("check");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '';
    } else {
      return '🤷‍';
    }
  }

  Icon getIcon(double temp) {
    if (temp < 10.0) {
      return Icon(Icons.snowing, color: Color.fromARGB(255, 1, 0, 1));
    } else if (temp > 20.0) {
      return Icon(
        Icons.cloud_circle,
        color: Color.fromARGB(255, 1, 0, 1),
      );
    } else {
      return Icon(
        Icons.sunny,
        color: Color.fromARGB(255, 1, 0, 1),
      );
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
