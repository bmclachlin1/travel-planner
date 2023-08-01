import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../helpers/weather_icon_helper.dart';
import '../models/city_model.dart';
import '../models/weather_model.dart';
import '../providers/scroll_controller_provider.dart';

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
      physics: const NeverScrollableScrollPhysics(),
      controller: context.read<ScrollControllerProvider>().controller,
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.black);
      },
      itemBuilder: (context, index) {
        final weather = weathers[index];
        final date =
            DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000, isUtc: true);
        return ListTile(
          title: Text(DateFormat('EEEE, MMMM d').format(date)),
          trailing: WeatherIconHelper.getWeatherIcon(weather.weather_id),
          subtitle: Text(
              "Will have a temperature of ${weather.temp} °C with ${weather.desc}. You can expect wind of ${weather.wind} meters/sec, and a humidity of ${weather.humidity}%.",
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.5)),
        );
      },
      itemCount: weathers.length,
    );
  }
}
