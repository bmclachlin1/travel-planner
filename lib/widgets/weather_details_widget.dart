import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/providers/selected_city_provider.dart';

import '../models/weather.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final city = context.read<SelectedCityProvider>().selectedCity;
    return Column(
      children: [
        Text(
            "Today in ${city?.name}, the temperature is ${weather.temp} °C with ${weather.desc}. You can expect wind of ${weather.wind} km/h, and a humidity of ${weather.humidity} AH.",
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
