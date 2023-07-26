import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String documentId;
  final String name;
  final String label;
  final String description;

  const City(
      {required this.documentId,
      required this.name,
      required this.label,
      required this.description});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        documentId: json['id'],
        name: json['name'],
        label: json['label'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() => {
        'id': documentId,
        'name': name,
        'label': label,
        'description': description
      };

  @override
  List<Object?> get props => [documentId, name, label, description];

  @override
  String toString() {
    return toJson().toString();
  }
}
