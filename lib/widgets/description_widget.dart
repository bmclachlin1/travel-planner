import 'package:flutter/material.dart';

import '../constants.dart';
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
            Text("Description",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: Sizes.medium),
            Text(_city?.description ?? 'Please select a location',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ));
  }
}
