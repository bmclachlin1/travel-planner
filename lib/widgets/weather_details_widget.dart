import 'package:flutter/material.dart';

import '../models/city.dart';
import '../models/weather.dart';

/// Encapsulates building the text for selected city
class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget(
      {super.key, required this.weather, required this.city});

  final Weather weather;
  final City city;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
            "Today in ${city.name}, the temperature is ${weather.temp} °C with ${weather.desc}. You can expect wind of ${weather.wind} km/h, and a humidity of ${weather.humidity} AH.",
            style: theme.textTheme.bodyLarge),
      ],
    );
  }
}
