import 'package:flutter/material.dart';
import 'package:silvacom_flutter/widgets/number_of_weather_days_dropdown_widget.dart';

import '../constants.dart';
import 'description_widget.dart';
import 'destination_dropdown_widget.dart';
import 'weather_widget.dart';

/// Renders the main content/widgets of the application
class TravelPlannerCardWidget extends StatelessWidget {
  const TravelPlannerCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.white.withOpacity(0.825),
      elevation: Sizes.xl,
      shadowColor: Colors.white.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: Sizes.medium),
              Text(Texts.cardHeader, style: theme.textTheme.headlineMedium),
              const SizedBox(height: Sizes.medium),
              DestinationDropdownWidget(),
              const SizedBox(height: Sizes.medium),
              const NumberOfWeatherDaysDropdownWidget(),
              const SizedBox(height: Sizes.medium),
              const DescriptionWidget(),
              const SizedBox(height: Sizes.medium),
              const WeatherWidget(),
              const SizedBox(height: Sizes.medium),
            ]),
      ),
    );
  }
}
