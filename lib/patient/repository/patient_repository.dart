import 'dart:convert';

import 'package:http/http.dart';

import '../models/patient_model.dart';

class PatientRepository {
  final client = Client();

  Future<List<PatientModel>> getPatients({String search = ""}) async {
    try {
      final response = await client.get(
        Uri.parse("http://192.168.1.33:8000/patients"),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode != 200) {
        return [];
      }

      final data = jsonDecode(response.body);

      final patients = (data as List)
          .map((e) => PatientModel.fromJson(e))
          .toList();

      if (search.isEmpty) {
        return patients;
      }

      return patients.where((patient) {
        return patient.name.toLowerCase().contains(search.toLowerCase());
      }).toList();
    } catch (e) {
      print(e);

      return [];
    }
  }
}
