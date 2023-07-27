import 'package:flutter/material.dart';

import '../models/city.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
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
            Text("Description",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text(_city?.description ?? 'Please select a location'),
          ],
        ));
  }
}
