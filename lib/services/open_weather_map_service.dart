import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/city_model.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
import '../secrets.dart';

/// Provides an interface to perform network calls on the OpenWeatherMap API
class OpenWeatherMapService {
  static getNextKDaysWeatherData(
      CityModel city, http.Client client, int? days) async {
    days ??= 1;
    final count = days * TimeOfDay.hoursPerDay / Forecast.forecastApiRate;
    final uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=${city.latlong[0]}&lon=${city.latlong[1]}&appid=${Secrets.openWeatherMapApiKey}&units=metric&cnt=$count");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      var weatherModels = <WeatherModel>[];
      final data = jsonDecode(response.body);
      for (var day = 0; day < days; day++) {
        weatherModels.add(WeatherModel.fromJson(data['list'][day * 8]));
      }
      return weatherModels;
    } else {
      throw Exception('Failed to load weather data for ${city.name}.');
    }
  }
}
