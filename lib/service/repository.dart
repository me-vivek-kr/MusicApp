import 'package:cloud_firestore/cloud_firestore.dart';
import 'model.dart';

class ServiceRepository {
  Future<List<ServiceModel>> fetchServices() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('services').get();
    return snapshot.docs.map((doc) => ServiceModel.fromFirestore(doc)).toList();
  }
}
