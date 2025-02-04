import 'package:dio/dio.dart';

// Arquivo de configuração do aplicativo.


// Endereço principal da API.
// Verifique o IP do servidor e troque de acordo.
const String URL_API_DEV = "http://192.168.10.3:8080";


// Relação de endpoints de consumo da API.
const String ENDPOINT_AUTH_LOGIN = "doasang/api/v1/auth/login";
const String ENDPOINT_UPLOAD_PAYLOAD = "doasang/api/v1/candidato/upload";
const String ENDPOINT_PERCENTUAL_OBESOS_POR_SEXO = "doasang/api/v1/percentual-de-obesos-por-sexo-controller";
const String ENDPOINT_MEDIA_IDADE_TIPO_SANGUINEO = "doasang/api/v1/media-de-idade-por-tipo-sanguineo-controller";
const String ENDPOINT_IMC_MEDIO_FAIXAS_ETARIAS = "doasang/api/v1/imc-medio-por-faixas-etarias-controller";
const String ENDPOINT_DOADORES_POR_TIPO_SANGUINEO = "doasang/api/v1/doadores-por-tipo-sanguineo-controller";
const String ENDPOINT_CANDIDATOS_POR_ESTADO = "doasang/api/v1/candidatos-por-estado-controller";

// Constantes de apresentaçao e controle.
const String APPLICATION_TITLE = 'Doa Sangue';
final Dio dio = Dio();
String authToken = ""; // Token JWT para autenticação.

// Configuração de requisições HTTP.
const int DIO_CONNECTION_TIMEOUT_SECONDS = 8;
const int DIO_RECEIVE_TIMEOUT_SECONDS = 5;

// Configurações de usuário para autenticação.
const String USUARIO_TESTE_LOGIN = "usuario1";
const String SENHA_TESTE_LOGIN = "password";



