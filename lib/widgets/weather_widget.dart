import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/providers/number_of_weather_days_provider.dart';

import '../constants.dart';
import '../providers/selected_city_provider.dart';
import '../services/open_weather_map_service.dart';
import 'weather_details_widget.dart';

/// Displays the weather for the city you are visiting
///
/// Uses [OpenWeatherMapService] to get weather data from an API
class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cityProvider = context.watch<SelectedCityProvider>();
    final numberOfWeatherDaysProvider =
        context.watch<NumberOfWeatherDaysProvider>();

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
            cityProvider.selectedCity == null
                ? Text(Texts.weatherHintText, style: theme.textTheme.bodyLarge)
                : FutureBuilder<dynamic>(
                    future: OpenWeatherMapService.getNextKDaysWeatherData(
                        cityProvider.selectedCity!,
                        http.Client(),
                        numberOfWeatherDaysProvider.numberOfDays),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return WeatherDetailsWidget(
                              weathers: snapshot.data!,
                              city: cityProvider.selectedCity!);
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
