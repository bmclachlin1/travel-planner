import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'models/city.dart';
import 'widgets/description_widget.dart';
import 'widgets/weather_widget.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(TravelPlanner());
}

class TravelPlanner extends StatefulWidget {
  const TravelPlanner({super.key});

  @override
  State<TravelPlanner> createState() => _TravelPlannerState();
}

class _TravelPlannerState extends State<TravelPlanner> {
  City? _city;
  final Stream<QuerySnapshot> _citiesStream =
      FirebaseFirestore.instance.collection('cities').snapshots();

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
                    StreamBuilder(
                      stream: _citiesStream,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: 450,
                          child: InputDecorator(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 4.0),
                                border: OutlineInputBorder()),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<City>(
                                  value: _city,
                                  items: snapshot.data!.docs.map((doc) {
                                    final Map<String, dynamic> data =
                                        doc.data()! as Map<String, dynamic>;
                                    data['id'] = doc.id;
                                    final city = City.fromJson(data);
                                    return DropdownMenuItem<City>(
                                        value: city,
                                        child: Text(
                                            "${city.name} (${city.label})"));
                                  }).toList(),
                                  onChanged: (city) {
                                    setState(() {
                                      _city = city;
                                    });
                                  }),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    DescriptionWidget(city: _city),
                    const SizedBox(height: 16),
                    WeatherWidget(city: _city),
                  ]),
            )));
  }
}
