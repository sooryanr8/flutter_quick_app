enum Environment {
  dev,
  qa,
  prod,
}

class AppEnvironment {
  static Environment current =
      Environment.dev;

  static String get baseUrl {
    switch (current) {
      case Environment.dev:
        return "http://192.168.1.33:8080";

      case Environment.qa:
        return "https://qa-api.xxx.com";

      case Environment.prod:
        return "https://api.xxx.com";
    }
  }
}