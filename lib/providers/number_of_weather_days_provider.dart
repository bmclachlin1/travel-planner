import 'package:flutter/material.dart';

class NumberOfWeatherDaysProvider extends ChangeNotifier {
  int? numberOfDays;

  void updateNumberOfDays(int? days) {
    numberOfDays = days;
    notifyListeners();
  }
}
