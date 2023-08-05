import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/weather_icon_helper.dart';
import '../models/city_model.dart';
import '../models/weather_model.dart';

/// Renders the weather forecast in a listview
///
/// Accepts a list of [WeatherModel] and a [CityModel] as
/// parameters.
class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget(
      {super.key, required this.weather, required this.city});

  final WeatherModel weather;
  final CityModel city;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final date =
        DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000, isUtc: true);
    return ListTile(
      title: Text(DateFormat('EEEE, MMMM d').format(date)),
      trailing: WeatherIconHelper.getWeatherIcon(weather.weatherId),
      subtitle: Text(
          "Will have a temperature of ${weather.temp} °C with ${weather.desc}. You can expect wind of ${weather.wind} meters/sec, and a humidity of ${weather.humidity}%.",
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.5)),
    );
  }
}
