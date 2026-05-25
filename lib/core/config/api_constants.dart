import 'app_config.dart';

class ApiConstants {

  // AUTH (Keycloak)
  static String get login =>
      "${AppConfig.authBaseUrl}/realms/test1/protocol/openid-connect/token";

  static String get refreshToken =>
      "${AppConfig.authBaseUrl}/realms/test1/protocol/openid-connect/token";

  static String get logout =>
      "${AppConfig.authBaseUrl}/realms/test1/protocol/openid-connect/logout";


  // API
  static String get searchPatients =>
      "${AppConfig.apiBaseUrl}/patients";
}