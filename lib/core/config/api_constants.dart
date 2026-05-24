import 'app_config.dart';

class ApiConstants {

  // AUTH (Keycloak)
  static String get login =>
      "${AppConfig.authBaseUrl}/realms/mobile/protocol/openid-connect/token";

  static String get refreshToken =>
      "${AppConfig.authBaseUrl}/realms/mobile/protocol/openid-connect/token";

  static String get logout =>
      "${AppConfig.authBaseUrl}/realms/mobile/protocol/openid-connect/logout";


  // API
  static String get searchPatients =>
      "${AppConfig.apiBaseUrl}/provider-bff/patient/search";

  static String get createEncounter =>
      "${AppConfig.apiBaseUrl}/provider-bff/encounter/create";

  static String get streamAudio =>
      "${AppConfig.apiBaseUrl}/provider-bff/encounter/audio/stream";

  static String get registerDevice =>
      "${AppConfig.apiBaseUrl}/provider-bff/device/register";
}