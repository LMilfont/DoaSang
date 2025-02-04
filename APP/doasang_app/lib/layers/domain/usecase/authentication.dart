import 'package:doasang_app/layers/infrastructure/auth_service.dart';

class AuthenticationUseCase {
  late final AuthenticationService _authService;

  AuthenticationUseCase(this._authService);

  Future<void> login(usr, pwd) async {
    await _authService.login(usr, pwd);
  }
}