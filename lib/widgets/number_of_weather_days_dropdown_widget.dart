import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/providers/number_of_weather_days_provider.dart';

import '../constants.dart';

class NumberOfWeatherDaysDropdownWidget extends StatelessWidget {
  const NumberOfWeatherDaysDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final numberOfWeatherDaysProvider =
        context.watch<NumberOfWeatherDaysProvider>();

    return SizedBox(
      width: Sizes.containerWidth,
      child: InputDecorator(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.small, vertical: Sizes.xs),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: Sizes.borderWidth),
                borderRadius: BorderRadius.circular(Sizes.medium))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
              hint: const Text(Texts.numberOfDaysHintText),
              value: numberOfWeatherDaysProvider.numberOfDays,
              items: Forecast.days
                  .map((day) => DropdownMenuItem<int>(
                      value: day, child: Text("${day.toString()} days")))
                  .toList(),
              onChanged: (days) {
                numberOfWeatherDaysProvider.updateNumberOfDays(days);
              }),
        ),
      ),
    );
  }
}
