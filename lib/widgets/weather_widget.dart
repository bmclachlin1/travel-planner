import 'package:flutter/material.dart';

import '../models/city.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required City? city,
  });

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
          ],
        ));
  }
}
