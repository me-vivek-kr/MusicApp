import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  final String title;
  final String description;
  final String icon;
  final String? background;

  ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
    this.background,
  });

  factory ServiceModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServiceModel(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
      background: data['background'],
    );
  }
}
