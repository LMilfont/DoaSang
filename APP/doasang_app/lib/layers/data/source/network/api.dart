import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:doasang_app/layers/data/dto/media_de_idade_por_tipo_sanguineo_dto.dart';
import 'package:doasang_app/layers/data/dto/percentual_obesos_por_sexo_dto.dart';
import 'package:doasang_app/layers/infrastructure/auth_interceptor.dart';

import '../../../application/helpers/app_config.dart';
import '../../dto/candidatos_por_estado_dto.dart';
import '../../dto/doadores_por_tipo_sanguineo_dto.dart';
import '../../dto/imc_medio_faixas_etarias_dto.dart';

abstract class Api {
  Future<void> login(usr, pwd);
  Future<void> uploadCandidatos(payload);
  Future<List<PercentualObesosPorSexoDto>> loadPercentualObesosPorSexo();
  Future<List<MediaDeIdadePorTipoSanguineoDto>> loadMediaDeIdadePorTipoSanguineo();
  Future<List<ImcMedioPorFaixasEtariasDto>> loadImcMedioPorFaixasEtarias();
  Future<List<DoadoresPorTipoSanguineoDto>> loadDoadoresPorTipoSanguineo();
  Future<List<CandidatosPorEstadoDto>> loadCandidatosPorEstado();
}

class ApiImpl implements Api {

  @override
  Future<void> login(usr, pwd) async {
    try {

      final Response response = await dio
          .post('$URL_API_DEV/$ENDPOINT_AUTH_LOGIN?username=$usr&password=$pwd',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      // Adiciona o token JWT recebido a um interceptador.
      authToken = response.data;
      dio.interceptors.add(AuthInterceptor(authToken));

    } on DioException catch (e) {
      // A requisição foi feita e o servidor respondeu com um código de status
      // fora da faixa de 2xx e, também não é 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API respondeu com 404 ao chegar no fim.
        if (e.response?.statusCode == 404) print("Not found");
      } else {
        print(e);
      }
    }
  }

  @override
  Future<void> uploadCandidatos(payload) async {
    try {

      final Response response = await dio
            .post('$URL_API_DEV/$ENDPOINT_UPLOAD_PAYLOAD',
              options: Options(headers: {
                          HttpHeaders.contentTypeHeader: "application/json",
                       }),
              data: jsonEncode(payload),
      );

    } on DioException catch (e) {
      // A requisição foi feita e o servidor respondeu com um código de status
      // fora da faixa de 2xx e, também não é 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API respondeu com 404 ao chegar no fim.
        if (e.response?.statusCode == 404) print("Not found");
      } else {
        print(e);
      }
    }
  }

  @override
  Future<List<PercentualObesosPorSexoDto>> loadPercentualObesosPorSexo() async {
    try {

      final Response<List<dynamic>> response = await dio
            .get('$URL_API_DEV/$ENDPOINT_PERCENTUAL_OBESOS_POR_SEXO');

      final l = (response.data as List<dynamic>)
          .map((e) => PercentualObesosPorSexoDto.fromMap(e))
          .toList();
      return l;

    } on DioException catch (e) {
      // A requisição foi feita e o servidor respondeu com um código de status
      // fora da faixa de 2xx e, também não é 304.

      if (e.response != null) {
        print(e.response?.statusCode);

        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API respondeu com 404 ao chegar no fim.
        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }

    return [];
  }

  @override
  Future<List<MediaDeIdadePorTipoSanguineoDto>> loadMediaDeIdadePorTipoSanguineo() async {
    try {
      final Response<List<dynamic>> response = await dio
            .get('$URL_API_DEV/$ENDPOINT_MEDIA_IDADE_TIPO_SANGUINEO');

      final l = (response.data as List<dynamic>)
          .map((e) => MediaDeIdadePorTipoSanguineoDto.fromMap(e))
          .toList();
      return l;

    } on DioException catch (e) {
      // A requisição foi feita e o servidor respondeu com um código de status
      // fora da faixa de 2xx e, também não é 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API respondeu com 404 ao chegar no fim.
        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }

    return [];
  }

  @override
  Future<List<ImcMedioPorFaixasEtariasDto>> loadImcMedioPorFaixasEtarias() async {
    try {
      final Response<List<dynamic>> response = await dio
          .get('$URL_API_DEV/$ENDPOINT_IMC_MEDIO_FAIXAS_ETARIAS');

      final l = (response.data as List<dynamic>)
          .map((e) => ImcMedioPorFaixasEtariasDto.fromMap(e))
          .toList();
      return l;

    } on DioException catch (e) {
      // A requisição foi feita e o servidor respondeu com um código de status
      // fora da faixa de 2xx e, também não é 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API respondeu com 404 ao chegar no fim.
        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }

    return [];
  }

  @override
  Future<List<DoadoresPorTipoSanguineoDto>> loadDoadoresPorTipoSanguineo() async {
    try {
      final Response<List<dynamic>> response = await dio
          .get('$URL_API_DEV/$ENDPOINT_DOADORES_POR_TIPO_SANGUINEO');

      final l = (response.data as List<dynamic>)
          .map((e) => DoadoresPorTipoSanguineoDto.fromMap(e))
          .toList();
      return l;

    } on DioException catch (e) {
      // A requisição foi feita e o servidor respondeu com um código de status
      // fora da faixa de 2xx e, também não é 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API respondeu com 404 ao chegar no fim.
        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }

    return [];
  }

  @override
  Future<List<CandidatosPorEstadoDto>> loadCandidatosPorEstado() async {
    try {
      final Response<List<dynamic>> response = await dio
          .get('$URL_API_DEV/$ENDPOINT_CANDIDATOS_POR_ESTADO');

      final l = (response.data as List<dynamic>)
          .map((e) => CandidatosPorEstadoDto.fromMap(e))
          .toList();
      return l;

    } on DioException catch (e) {
      // A requisição foi feita e o servidor respondeu com um código de status
      // fora da faixa de 2xx e, também não é 304.
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        //  API respondeu com 404 ao chegar no fim.
        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }

    return [];
  }

}