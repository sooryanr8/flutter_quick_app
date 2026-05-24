import '../../../core/api/api_client.dart';
import '../../../core/config/api_constants.dart';

import '../models/token_model.dart';

class AuthRepository {
  final ApiClient api;

  AuthRepository(this.api);

  Future<TokenModel> login({
    required String username,
    required String password,
  }) async {
    final result = await api.post(
      url: ApiConstants.login,

      body: {
        "grant_type": "password",

        "client_id": "flutter_client",

        "username": username,

        "password": password,
      },
    );

    return TokenModel.fromJson(result);
  }
}
