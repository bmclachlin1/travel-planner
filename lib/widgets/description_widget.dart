import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/city.dart';

/// Describes the city you are visiting
class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.city});

  final City? city;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Texts.descriptionHeader,
                    style: theme.textTheme.headlineSmall),
                const Icon(Icons.description,
                    size: Sizes.xl, color: Colors.indigo)
              ],
            ),
            const SizedBox(height: Sizes.medium),
            Text(city?.description ?? Texts.descriptionHintText,
                style: theme.textTheme.bodyLarge),
          ],
        ));
  }
}
