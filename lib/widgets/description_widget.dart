import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/selected_city_provider.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
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
            Text("Description",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: Sizes.medium),
            Text(
                cityProvider.selectedCity?.description ??
                    'Please select a location',
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ));
  }
}
