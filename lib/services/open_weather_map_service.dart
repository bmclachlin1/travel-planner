import 'dart:convert';

import '../models/city_model.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
import '../secrets.dart';

class OpenWeatherMapService {
  static getCurrentWeatherData(CityModel city, http.Client client) async {
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${city.latlong[0]}&lon=${city.latlong[1]}&appid=${Secrets.openWeatherMapApiKey}&units=metric");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data for ${city.name}.');
    }
  }
}
