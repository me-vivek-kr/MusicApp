import 'package:flutter/material.dart';
import 'repository.dart';
import 'model.dart';

class ServiceViewModel extends ChangeNotifier {
  final ServiceRepository _repository = ServiceRepository();

  List<ServiceModel> services = [];
  bool loading = false;
  String? error;

  Future<void> fetchServices() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      services = await _repository.fetchServices();
    } catch (e) {
      error = 'Error loading services';
    }
    loading = false;
    notifyListeners();
  }
}
