import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/session_manager.dart';
import '../repository/auth_repository.dart';

class AuthBloc extends Cubit<bool> {
  final AuthRepository repo;

  AuthBloc(this.repo) : super(false);

  Future<void> login(
      String username,
      String password,
      ) async {
    print("LOGIN CLICKED");

    try {
      final token = await repo.login(
        username: username,
        password: password,
      );

      print("TOKEN RECEIVED");
      print(token);

      await SessionManager.saveToken(
        token.accessToken,
      );

      emit(true);

      print("LOGIN SUCCESS");
    } catch (e) {
      print("LOGIN FAILED");
      print(e);

      emit(false);
    }
  }

  Future<void> logout() async {
    await SessionManager.logout();

    emit(false);
  }
}
