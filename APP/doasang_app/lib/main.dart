import 'package:doasang_app/layers/domain/usecase/authentication.dart';
import 'package:doasang_app/layers/domain/usecase/upload_candidatos.dart';
import 'package:flutter/material.dart';
import 'package:doasang_app/layers/presentation/app_root.dart';
import 'layers/application/helpers/app_config.dart';
import 'layers/data/source/network/api.dart';
import 'layers/infrastructure/auth_service.dart';
import 'layers/infrastructure/json_file_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configuração de opções da biblioteca http Dio.
  dio.options.connectTimeout = Duration(seconds: DIO_CONNECTION_TIMEOUT_SECONDS); // 5 segundos de timeout para conexão.
  dio.options.receiveTimeout = Duration(seconds: DIO_RECEIVE_TIMEOUT_SECONDS); // 3 segundos de timeout para receber a resposta.

  // Instancia o serviço de API.
  final api = ApiImpl();

  // Tenta autenticar o usuário.
  final auth = AuthenticationUseCase(AuthenticationService(api: api));
  await auth.login(USUARIO_TESTE_LOGIN, SENHA_TESTE_LOGIN);

  // Realiza upload do arquivo JSON de candidatos, armazenado em "assets".
  final uploadCandidatos = UploadCandidatosUseCase(JsonFileService(api: api));
  await uploadCandidatos.sendPayload();

  // Executa o APP.
  runApp(AppRoot());
}