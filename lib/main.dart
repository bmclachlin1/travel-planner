import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'firebase_options.dart';
import 'providers/selected_city_provider.dart';
import 'widgets/description_widget.dart';
import 'widgets/destination_dropdown_widget.dart';
import 'widgets/weather_widget.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => SelectedCityProvider(),
      child: const TravelPlanner()));
}

class TravelPlanner extends StatelessWidget {
  const TravelPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel Planner',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                foregroundColor: Colors.white, backgroundColor: Colors.green),
            useMaterial3: true,
            primarySwatch: Colors.green,
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Travel Planner'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select your destination!",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.green)),
                        const SizedBox(width: Sizes.large),
                        const Icon(Icons.travel_explore,
                            color: Colors.blueAccent, size: Sizes.xl),
                      ],
                    ),
                    const SizedBox(height: Sizes.medium),
                    DestinationDropdownWidget(),
                    const SizedBox(height: Sizes.medium),
                    const DescriptionWidget(),
                    const SizedBox(height: Sizes.medium),
                    const WeatherWidget(),
                  ]),
            )));
  }
}
