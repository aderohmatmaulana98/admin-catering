import 'dart:convert';

import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/utils/config.dart';
import 'package:cathering_mobile/features/beranda/data/models/paket_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PaketLocalDataSource {
  Future<List<PaketModel>>? getCachedPaket();
  Future<void> cachedPaket(List<PaketModel> paket);
}

class PaketLocalDataSourceImpl implements PaketLocalDataSource {
  final SharedPreferences preferences;

  PaketLocalDataSourceImpl({required this.preferences});

  @override
  Future<void> cachedPaket(List<PaketModel> paket) {
    return preferences.setString(
      PAKET_KEY, 
      jsonEncode(paketModelToJson(paket))
    );
  }

  @override
  Future<List<PaketModel>>? getCachedPaket() {
    final jsonString = preferences.getString(PAKET_KEY);
    if (jsonString != null) {
      return Future.value(paketModelFromJson(jsonString));
    } else {
      throw CacheException(message: 'Mohon periksa koneksi anda');
    }
  }
}