import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/geo_location.dart';
import 'package:weather/weather_info.dart';
import 'package:weather/weather_page.dart';

class LoadingPage extends StatefulWidget {

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  WeatherData weatherData;

  void fetchWeatherData() async {
    Position position = await GeoLocation.fetchPosition();
    print('Position: $position');
    weatherData = await WeatherInfo.fetchWeatherData(position);
    print('Weather: $weatherData');
        Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WeatherPage(weatherData: weatherData);
      }
    ));
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: SpinKitDoubleBounce(
        color: Colors.pinkAccent,
      )
    );
  }
}
