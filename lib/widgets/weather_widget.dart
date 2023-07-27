import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/city.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';
import 'weather_details_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required City? city,
  }) : _city = city;

  final City? _city;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sizes.containerWidth,
        height: Sizes.containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.small),
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Weather", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: Sizes.medium),
            _city == null
                ? const Text('Please select a location')
                : FutureBuilder<dynamic>(
                    future: WeatherService.getWeatherData(_city!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data!);
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
