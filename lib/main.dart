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
    final cityProvider = context.watch<SelectedCityProvider>();
    final theme = Theme.of(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                      image: NetworkImage(Apis.backgroundImageUri))),
              child: Center(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: Sizes.xl,
                    shadowColor: Colors.white.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.medium),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: Sizes.medium),
                            Text(Texts.cardHeader,
                                style: theme.textTheme.headlineMedium),
                            const SizedBox(height: Sizes.medium),
                            DestinationDropdownWidget(
                                city: cityProvider.selectedCity),
                            const SizedBox(height: Sizes.medium),
                            DescriptionWidget(city: cityProvider.selectedCity),
                            const SizedBox(height: Sizes.medium),
                            WeatherWidget(city: cityProvider.selectedCity),
                            const SizedBox(height: Sizes.medium),
                          ]),
                    ),
                  ),
                ),
              ),
            )));
  }
}
