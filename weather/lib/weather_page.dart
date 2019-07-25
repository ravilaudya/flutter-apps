import 'package:flutter/material.dart';
import 'package:weather/weather_info.dart';


class WeatherPage extends StatelessWidget {
  final WeatherData weatherData;

  WeatherPage({@required this.weatherData}) {
  }

  @override
  Widget build(BuildContext context) {
    String _temp = (weatherData.status == "ok")? (weatherData.result['temperature'] - 273.15).toInt().toString(): "N/A";
    String _status = (weatherData.status == "ok")? weatherData.result['description'] : weatherData.error;

    return Container(
      color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            _temp  + '˚',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _status,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}