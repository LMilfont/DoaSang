import 'package:doasang_app/layers/domain/entity/media_de_idade_por_tipo_sanguineo.dart';
import 'package:doasang_app/layers/domain/usecase/get_all_media_idade_por_tipo_sanguineo.dart';
import 'package:flutter/material.dart';

class MediaIdadePorTipoSanguineoChangeProvider extends ChangeNotifier {
  MediaIdadePorTipoSanguineoChangeProvider({
    required GetAllMediaIdadePorTipoSanguineo getAllMediaIdadePorTipoSanguineo,
    List<MediaDeIdadePorTipoSanguineo>? mediaIdadePorTipoSanguineo
  })  : _getAllMediaIdadePorTipoSanguineo = getAllMediaIdadePorTipoSanguineo,
        _mediaIdadePorTipoSanguineo = mediaIdadePorTipoSanguineo ?? [];

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  final GetAllMediaIdadePorTipoSanguineo _getAllMediaIdadePorTipoSanguineo;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  final List<MediaDeIdadePorTipoSanguineo> _mediaIdadePorTipoSanguineo;
  List<MediaDeIdadePorTipoSanguineo> get mediaIdadePorTipoSanguineo => List.unmodifiable(_mediaIdadePorTipoSanguineo);

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------
  Future<void> fetchMediaIdadePorTipoSanguineo() async {
    final list = await _getAllMediaIdadePorTipoSanguineo();
    _mediaIdadePorTipoSanguineo.addAll(list);

    notifyListeners();
  }
}