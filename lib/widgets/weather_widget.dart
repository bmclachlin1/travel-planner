import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/selected_city_provider.dart';
import '../services/open_weather_map_service.dart';
import 'weather_details_widget.dart';

/// Displays the weather for the city you are visiting
class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final providedCity = context.watch<SelectedCityProvider>();

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(Texts.weatherHeader, style: theme.textTheme.headlineSmall),
                const Icon(Icons.cloud, color: Colors.blue, size: Sizes.xl)
              ],
            ),
            const SizedBox(height: Sizes.medium),
            providedCity.selectedCity == null
                ? Text(Texts.weatherHintText, style: theme.textTheme.bodyLarge)
                : FutureBuilder<dynamic>(
                    future: OpenWeatherMapService.getCurrentWeatherData(
                        providedCity.selectedCity!, http.Client()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return WeatherDetailsWidget(
                              weather: snapshot.data!,
                              city: providedCity.selectedCity!);
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
