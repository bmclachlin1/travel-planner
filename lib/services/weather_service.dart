import 'dart:convert';

import '../constants.dart';
import '../models/city.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static getWeatherData(City city) async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${city.latlong[0]}&lon=${city.latlong[1]}&appid=${Constants.openWeatherMapApiKey}&units=metric");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body).toString();
    }
    return "Something went wrong";
  }
}
