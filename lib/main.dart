import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:silvacom_flutter/providers/selected_weather_day_provider.dart';

import 'constants.dart';
import 'firebase_options.dart';
import 'providers/scroll_controller_provider.dart';
import 'providers/selected_city_provider.dart';
import 'widgets/travel_planner_card_widget.dart';

/// The starting point of our application
///
/// Calls run app to mount [TravelPlanner] as the root of our widget tree
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Multiprovider allows us to pass multiple observables to our application
  ///
  /// Here we are providing the city and number of days for weather forecast to the root
  /// of our application. Child widgets can then subscribe to this state, and rebuild
  /// when the state changes.
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SelectedCityProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ScrollControllerProvider()),
    ChangeNotifierProvider(create: (context) => SelectedWeatherDayProvider())
  ], child: const TravelPlanner()));
}

/// The root widget of our application
///
/// Renders a [MaterialApp] and [Scaffold] containing a
/// [TravelPlannerCardWidget] for the main application content
class TravelPlanner extends StatelessWidget {
  const TravelPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
        title: Texts.htmlWindowTitle,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                foregroundColor: Colors.white, backgroundColor: Colors.indigo),
            useMaterial3: true,
            primarySwatch: Colors.indigo,
            textTheme: GoogleFonts.montserratTextTheme(theme.textTheme)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text(Texts.appBarTitle),
              centerTitle: true,
            ),
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(NetworkImages.backgroundImageUri))),
              child: Center(
                child: Scrollbar(
                  controller:
                      context.read<ScrollControllerProvider>().controller,
                  child: const SingleChildScrollView(
                    child: TravelPlannerCardWidget(),
                  ),
                ),
              ),
            )));
  }
}
