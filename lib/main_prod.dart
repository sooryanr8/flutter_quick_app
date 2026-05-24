import 'core/config/app_config.dart';
import 'core/config/environment.dart';
import 'main.dart';

void main() async {
  AppConfig.initialize(
    Environment.prod,
  );

  await startApp();
}