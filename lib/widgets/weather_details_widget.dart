import 'package:flutter/material.dart';

import '../models/city_model.dart';
import '../models/weather_model.dart';

/// Uses details from [WeatherWidget] to render a specific description of the weather
class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget(
      {super.key, required this.weather, required this.city});

  final WeatherModel weather;
  final CityModel city;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
            "Today in ${city.name}, the temperature is ${weather.temp} °C with ${weather.desc}. You can expect wind of ${weather.wind} km/h, and a humidity of ${weather.humidity}%.",
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.5)),
      ],
    );
  }
}
