import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/city.dart';
import '../models/weather.dart';
import '../services/open_weather_map_service.dart';
import 'weather_details_widget.dart';

/// Displays the weather for the city you are visiting
class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.city});

  final City? city;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        width: Sizes.containerWidth,
        height: Sizes.containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.medium),
          border: Border.all(color: Colors.black, width: Sizes.borderWidth),
        ),
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Texts.weatherHeader, style: theme.textTheme.headlineSmall),
                const Icon(Icons.cloud, color: Colors.blue, size: Sizes.xl)
              ],
            ),
            const SizedBox(height: Sizes.medium),
            city == null
                ? Text(Texts.weatherHintText, style: theme.textTheme.bodyLarge)
                : FutureBuilder<dynamic>(
                    future: OpenWeatherMapService.getCurrentWeatherData(city!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return WeatherDetailsWidget(
                              weather: Weather.fromJson(snapshot.data!),
                              city: city!);
                        } else if (snapshot.hasError) {
                          return const Text(Texts.genericError);
                        }
                      }
                      return const Center(child: CircularProgressIndicator());
                    })
          ],
        ));
  }
}
