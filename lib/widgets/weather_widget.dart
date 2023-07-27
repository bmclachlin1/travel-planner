import 'package:flutter/material.dart';

import '../models/city.dart';
import '../services/weather_service.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required City? city,
  }) : _city = city;

  final City? _city;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 450,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Weather", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            _city == null
                ? const Text('Please select a location')
                : FutureBuilder<dynamic>(
                    future: WeatherService.getWeatherData(_city!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!);
                      } else if (snapshot.hasError) {
                        return const Text("Something went wrong.");
                      }
                      return const Center(child: CircularProgressIndicator());
                    })
          ],
        ));
  }
}
