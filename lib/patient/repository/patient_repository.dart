import 'dart:convert';

import 'package:http/http.dart';

import '../../../core/config/api_constants.dart';
import '../../../core/logger/logger_helper.dart';
import '../models/patient_model.dart';

class PatientRepository {
  final Client client = Client();

  Future<List<PatientModel>> getPatients({String search = ""}) async {
    try {
      logInfo('Fetching patients | search=$search');

      final response = await client.get(Uri.parse(ApiConstants.searchPatients));

      logInfo('API STATUS -> ${response.statusCode}');

      logDebug(response.body);

      if (response.statusCode != 200) {
        throw Exception("Failed to load patients");
      }

      final List<dynamic> data = jsonDecode(response.body);

      final patients = data
          .map((e) => PatientModel.fromJson(e))
          .where((p) => p.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
      logInfo('Parsed patients -> ${patients.length}');

      return patients;
    } catch (e, s) {
      logError('PatientRepository error', error: e, stackTrace: s);

      return [];
    }
  }
}
