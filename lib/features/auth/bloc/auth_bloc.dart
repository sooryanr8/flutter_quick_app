import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/auth_repository.dart';

class AuthBloc extends Cubit<bool> {
  final AuthRepository repo;

  AuthBloc(this.repo) : super(false);

  Future<void> login(String user, String pass) async {
    try {
      await repo.login(username: user, password: pass);

      emit(true);
    } catch (_) {
      emit(false);
    }
  }
}
