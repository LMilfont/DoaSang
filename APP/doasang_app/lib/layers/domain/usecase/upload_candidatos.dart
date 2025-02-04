import '../../infrastructure/json_file_service.dart';

class UploadCandidatosUseCase {
  late final JsonFileService _jsonFileService;

  UploadCandidatosUseCase(this._jsonFileService);

  Future<void> sendPayload() async {
    await _jsonFileService.uploadJsonFile();
  }
}