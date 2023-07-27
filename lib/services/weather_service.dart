import 'dart:convert';

import '../constants.dart';
import '../models/city.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static getCurrentWeatherData(City city) async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${city.latlong[0]}&lon=${city.latlong[1]}&appid=${Api.openWeatherMapApiKey}&units=metric");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data for ${city.name}.');
    }
  }
}
