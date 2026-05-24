import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  static const storage =
  FlutterSecureStorage();

  static Future<bool>
  isLoggedIn() async {
    final token =
    await storage.read(
      key: "access_token",
    );

    return token != null;
  }

  static Future<void>
  saveToken(
      String token,
      ) async {
    await storage.write(
      key: "access_token",
      value: token,
    );
  }

  static Future<void>
  logout() async {
    await storage.deleteAll();
  }
}