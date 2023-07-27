import 'package:flutter/material.dart';

import '../models/weather.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${weather.temp} degrees with ${weather.desc}",
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
