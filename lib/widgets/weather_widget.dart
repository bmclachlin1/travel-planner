import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/providers/selected_city_provider.dart';

import '../constants.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';
import 'weather_details_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cityProvider = context.watch<SelectedCityProvider>();

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
            Text("Weather", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: Sizes.medium),
            cityProvider.selectedCity == null
                ? Text('Please select a location',
                    style: Theme.of(context).textTheme.bodyLarge)
                : FutureBuilder<dynamic>(
                    future: WeatherService.getCurrentWeatherData(
                        cityProvider.selectedCity!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return WeatherDetailsWidget(
                            weather: Weather.fromJson(snapshot.data!));
                      } else if (snapshot.hasError) {
                        return const Text("Something went wrong.");
                      }
                      return const Center(child: CircularProgressIndicator());
                    })
          ],
        ));
  }
}
