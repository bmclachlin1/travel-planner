import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class SelectedWeatherDayProvider extends ChangeNotifier {
  WeatherModel? selectedWeather;

  void updateSelectedCity(WeatherModel? weather) {
    selectedWeather = weather;
    notifyListeners();
  }
}
