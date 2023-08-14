import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
  color: Color.fromARGB(255, 1, 0, 1),
);

const kforecastTextStyle = TextStyle(
  color: Color.fromARGB(255, 1, 0, 1),
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
  color: Color.fromARGB(255, 1, 0, 1),
  // fontWeight: FontWeight.w400,
);

const kButtonTextStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 30.0,
    color: Color.fromARGB(255, 1, 0, 1),
    fontFamily: 'Roboto');

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kInputDecoration = InputDecoration(
    filled: true,
    fillColor: Color.fromARGB(255, 1, 0, 1),
    hintText: 'City',
    hintStyle: TextStyle(
      color: Color.fromARGB(255, 255, 255, 67),
    ),
    icon: Icon(
      Icons.add_location_alt,
      color: Color.fromARGB(255, 1, 0, 1),
      size: 40.0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(25.0),
      ),
    ),
    contentPadding: EdgeInsets.all(10.0));
