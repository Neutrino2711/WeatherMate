import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({this.wind, this.humidity, this.visibility});

  final num? wind;
  final int? humidity;
  final int? visibility;

  Widget Values(IconData icon, var property, String propertyName) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 40.0,
          ),
          Text(
            property.toString(),
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          Text(
            propertyName,
            style: TextStyle(
              fontSize: 15.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 1, 0, 1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Values(Icons.air, wind, "Wind"),
        Values(Icons.water_drop, humidity, "Humidity"),
        Values(Icons.remove_red_eye, visibility, "Visibility"),
      ]),
    );
  }
}
