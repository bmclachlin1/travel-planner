import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/city.dart';

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
            primarySwatch: Colors.green),
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
                        return DropdownButton<City>(
                            value: _city,
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
                              setState(() {
                                _city = city;
                              });
                            });
                      },
                    ),
                    Container(
                        width: 450,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Description",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            SizedBox(height: 16),
                            Text(_city?.description ?? 'empty'),
                          ],
                        )),
                    Container(
                      width: 450,
                      height: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      padding: EdgeInsets.all(16),
                    )
                  ]),
            )));
  }
}
