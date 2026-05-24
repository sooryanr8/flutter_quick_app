import 'dart:convert';

import 'package:http/http.dart';

import '../../../core/config/api_constants.dart';
import '../models/patient_model.dart';

class PatientRepository {
  final Client client = Client();

  Future<List<PatientModel>> getPatients({String search = ""}) async {
    final response = await client.post(
      Uri.parse(ApiConstants.searchPatients),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({"search": search}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to load patients");
    }

    final data = jsonDecode(response.body);

    return (data["patients"] as List)
        .map((e) => PatientModel.fromJson(e))
        .toList();
  }
}
