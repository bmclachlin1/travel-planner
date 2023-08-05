import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class SelectedWeatherDayProvider extends ChangeNotifier {
  WeatherModel? selectedWeather;

  void updateSelectedWeather(WeatherModel? weather) {
    selectedWeather = weather;
    notifyListeners();
  }
}
