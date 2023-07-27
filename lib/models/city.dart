import 'package:equatable/equatable.dart';

/// A domain model for a city
class City extends Equatable {
  /// The document id as stored in firebase cloud firestore
  final String documentId;

  /// The name of the city
  final String name;

  /// The airport code of the city
  final String label;

  /// A description of the city
  final String description;

  /// The latitude and longitude of the city, stored as [lat, long]
  final List<dynamic> latlong;

  const City(
      {required this.documentId,
      required this.name,
      required this.label,
      required this.description,
      required this.latlong});

  /// Factory method used to construct a City from JSON, given its internal constructor
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        documentId: json['id'],
        name: json['name'],
        label: json['label'],
        description: json['description'],
        latlong: json['latlong']);
  }

  /// Used to convert a City to JSON
  Map<String, dynamic> toJson() => {
        'id': documentId,
        'name': name,
        'label': label,
        'description': description,
        'latlong': latlong
      };

  @override
  List<Object?> get props => [documentId, name, label, description];

  @override
  String toString() {
    return toJson().toString();
  }
}
