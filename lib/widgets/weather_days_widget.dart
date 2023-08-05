import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/helpers/weather_icon_helper.dart';
import 'package:silvacom_flutter/providers/selected_weather_day_provider.dart';
import 'package:silvacom_flutter/services/open_weather_map_service.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/weather_model.dart';
import '../providers/selected_city_provider.dart';

class WeatherDaysWidget extends StatelessWidget {
  const WeatherDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cityProvider = context.watch<SelectedCityProvider>();

    return cityProvider.selectedCity == null
        ? const SizedBox.shrink()
        : SizedBox(
            width: Sizes.containerWidth,
            child: FutureBuilder<dynamic>(
                future: OpenWeatherMapService.getNextKDaysWeatherData(
                    cityProvider.selectedCity!, http.Client(), 5),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final weatherModels = snapshot.data!;
                      return Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: weatherModels
                                  .map<Widget>((WeatherModel weather) {
                                final date =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather.dt * 1000,
                                        isUtc: true);
                                return ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<SelectedWeatherDayProvider>()
                                        .updateSelectedWeather(weather);
                                  },
                                  child: Column(
                                    children: [
                                      WeatherIconHelper.getWeatherIcon(
                                          weather.weatherId),
                                      Text(DateFormat('MMM d').format(date))
                                    ],
                                  ),
                                );
                              }).toList()),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text(Texts.genericError);
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          );
  }
}
