
import "package:http/http.dart" as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert' show json;

String _weatherBaseUrl = "https://samples.openweathermap.org/data/2.5/weather?appid=b6907d289e10d714a6e88b30761fae22&";


class WeatherData {
  final String status;
  final String error;
  final Map result;

  WeatherData({this.error, this.result, this.status});

  String toString() {
    return {"status": status, "error": error, "result": result}.toString();
  }

}

class WeatherInfo {

  static Future<WeatherData> fetchWeatherData(Position position) async {
    if (position == null) {
      return null;
    }
    String url = _weatherBaseUrl + 'lat=${position.latitude.toString()}&lon=${position.longitude.toString()}';
    http.Response response = await http.get(url);
    if (response == null) {
      print("Invalid Response: null");
      return WeatherData(status: "error", error: "Oops. Couldn't fetch weather data. Please try again.");
    }
    if (response.statusCode != 200) {
      print("Invalid status code: ${response.statusCode}, body: ${response.body}");
      return WeatherData(status: "error", error: "Oops. Couldn't fetch weather data. Please try again.");
    }
    Map data = convertToJson(response.body);
    return WeatherData(status: "ok", result: {
      'temperature': data['main']['temp'],
      'city': data['name'],
      'description': data['weather'][0]['description'],
    });
  }

  static Map convertToJson(String content) {
    return json.decode(content);
  }

}