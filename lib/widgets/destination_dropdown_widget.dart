import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/providers/selected_weather_day_provider.dart';

import '../constants.dart';
import '../models/city_model.dart';
import '../providers/selected_city_provider.dart';

/// Loads cities from firebase, and renders a dropdown for user to select a city
///
/// Persists the state to [SelectedCityProvider]
class DestinationDropdownWidget extends StatelessWidget {
  DestinationDropdownWidget({super.key});

  final Stream<QuerySnapshot> _citiesStream =
      FirebaseFirestore.instance.collection(Texts.citiesCollection).snapshots();

  @override
  Widget build(BuildContext context) {
    final cityProvider = context.watch<SelectedCityProvider>();

    return StreamBuilder(
      stream: _citiesStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                child: DropdownButton<CityModel>(
                    hint: const Text(Texts.dropdownHintText),
                    value: cityProvider.selectedCity,
                    items: snapshot.data!.docs.map((doc) {
                      final Map<String, dynamic> data =
                          doc.data()! as Map<String, dynamic>;
                      data['id'] = doc.id;
                      final city = CityModel.fromJson(data);

                      return DropdownMenuItem<CityModel>(
                          value: city,
                          child: Text("${city.name} (${city.label})"));
                    }).toList(),
                    onChanged: (city) {
                      cityProvider.updateSelectedCity(city);
                      context
                          .read<SelectedWeatherDayProvider>()
                          .updateSelectedWeather(null);
                    }),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text(Texts.genericError);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
