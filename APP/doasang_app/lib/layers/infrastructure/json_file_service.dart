import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:doasang_app/layers/data/source/network/api.dart';

class JsonFileService {
  final Api _api;

  JsonFileService({
    required Api api,
  })  : _api = api;

  Future<void> uploadJsonFile() async {
      final payload = jsonDecode(await rootBundle.loadString('assets/payload_candidatos.json'));

      await _api.uploadCandidatos(payload);
    }
}