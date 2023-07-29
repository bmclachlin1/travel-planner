import 'package:flutter/material.dart';

import '../models/city_model.dart';

class SelectedCityProvider extends ChangeNotifier {
  CityModel? selectedCity;

  void updateSelectedCity(CityModel? city) {
    selectedCity = city;
    notifyListeners();
  }
}
