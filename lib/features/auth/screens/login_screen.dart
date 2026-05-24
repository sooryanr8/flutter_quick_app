import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/api_client.dart';
import '../bloc/auth_bloc.dart';
import '../repository/auth_repository.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final bloc = AuthBloc(AuthRepository(ApiClient()));

  final user = TextEditingController();

  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(controller: user),

              TextField(controller: pass),

              ElevatedButton(
                onPressed: () {
                  bloc.login(user.text, pass.text);
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
