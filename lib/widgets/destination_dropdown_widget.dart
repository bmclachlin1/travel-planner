import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/city.dart';
import '../providers/selected_city_provider.dart';

class DestinationDropdownWidget extends StatelessWidget {
  DestinationDropdownWidget({
    super.key,
  });

  final Stream<QuerySnapshot> _citiesStream =
      FirebaseFirestore.instance.collection('cities').snapshots();

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
                  hintText: "Please select a destination",
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.small, vertical: Sizes.xs),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: Sizes.borderWidth),
                      borderRadius: BorderRadius.circular(Sizes.medium))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<City>(
                    value: cityProvider.selectedCity,
                    items: snapshot.data!.docs.map((doc) {
                      final Map<String, dynamic> data =
                          doc.data()! as Map<String, dynamic>;
                      data['id'] = doc.id;
                      final city = City.fromJson(data);

                      return DropdownMenuItem<City>(
                          value: city,
                          child: Text("${city.name} (${city.label})"));
                    }).toList(),
                    onChanged: (city) {
                      cityProvider.updateSelectedCity(city);
                    }),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Something went wrong.');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}