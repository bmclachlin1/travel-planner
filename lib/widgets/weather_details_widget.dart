import 'package:flutter/material.dart';

import '../models/city_model.dart';
import '../models/weather_model.dart';

/// Uses details from [WeatherWidget] to render a specific description of the weather
class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget(
      {super.key, required this.weathers, required this.city});

  final List<WeatherModel> weathers;
  final CityModel city;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.black);
      },
      itemBuilder: (context, index) {
        final weather = weathers[index];
        return ListTile(
          title: Text("Day ${index + 1}"),
          subtitle: Text(
              "Will have a temperature of ${weather.temp} °C with ${weather.desc}. You can expect wind of ${weather.wind} km/h, and a humidity of ${weather.humidity}%.",
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.5)),
        );
      },
      itemCount: weathers.length,
    );
  }
}
