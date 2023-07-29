import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'firebase_options.dart';
import 'providers/selected_city_provider.dart';
import 'widgets/travel_planner_card_widget.dart';

/// The starting point of our application
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
      create: (context) => SelectedCityProvider(),
      child: const TravelPlanner()));
}

/// Stateless Widget containing the entire SPA (single page application)
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
                  child: SingleChildScrollView(
                    child: TravelPlannerCardWidget(theme: theme),
                  ),
                ),
              ),
            )));
  }
}
