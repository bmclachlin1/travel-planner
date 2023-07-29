import 'dart:convert';

import '../constants.dart';
import '../models/city.dart';
import 'package:http/http.dart' as http;

import '../models/weather.dart';

class OpenWeatherMapService {
  static getCurrentWeatherData(City city, http.Client client) async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${city.latlong[0]}&lon=${city.latlong[1]}&appid=${Apis.openWeatherMapApiKey}&units=metric");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data for ${city.name}.');
    }
  }
}
