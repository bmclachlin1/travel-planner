import 'package:flutter/material.dart';

import '../models/city.dart';

class SelectedCityProvider extends ChangeNotifier {
  City? selectedCity;

  void updateSelectedCity(City? city) {
    selectedCity = city;
    notifyListeners();
  }
}
