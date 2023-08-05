import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/providers/selected_weather_day_provider.dart';

import '../constants.dart';
import '../providers/selected_city_provider.dart';
import '../services/open_weather_map_service.dart';
import 'weather_details_widget.dart';

/// Displays the weather for the city you are visiting
///
/// Uses [OpenWeatherMapService] to get weather data from an API
///
/// Subscribes to [SelectedCityProvider] and [NumberOfWeatherDaysProvider]
/// and rebuilds when one of them changes
class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cityProvider = context.watch<SelectedCityProvider>();
    final weatherDayProvider = context.watch<SelectedWeatherDayProvider>();

    return Container(
        width: Sizes.containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.medium),
          border: Border.all(color: Colors.black, width: Sizes.borderWidth),
        ),
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(Texts.weatherHeader, style: theme.textTheme.headlineSmall),
            const SizedBox(height: Sizes.medium),
            cityProvider.selectedCity == null ||
                    weatherDayProvider.selectedWeather == null
                ? Text(Texts.weatherHintText, style: theme.textTheme.bodyLarge)
                : WeatherDetailsWidget(
                    city: cityProvider.selectedCity!,
                    weather: weatherDayProvider.selectedWeather!)
          ],
        ));
  }
}
