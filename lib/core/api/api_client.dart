import 'dart:convert';
import 'package:http/http.dart';

class ApiClient {
  final Client client = Client();

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, String> body,
  }) async {
    final response = await client.post(
      Uri.parse(url),
      body: body,
    );

    if (response.statusCode >= 400) {
      throw Exception(response.body);
    }

    return jsonDecode(response.body);
  }
}