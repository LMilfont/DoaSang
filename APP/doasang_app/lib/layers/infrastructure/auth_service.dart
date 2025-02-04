import 'package:doasang_app/layers/data/source/network/api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({
    required Api api,
  })  : _api = api;

  Future<void> login(usr, pwd) async {
      await _api.login(usr, pwd);
    }
}