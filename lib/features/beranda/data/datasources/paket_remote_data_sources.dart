import 'dart:convert';
import 'dart:developer';

import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/error/model/error.dart';
import 'package:cathering_mobile/core/utils/config.dart';
import 'package:cathering_mobile/features/beranda/data/models/paket_model.dart';
import 'package:cathering_mobile/features/login/data/datasources/login_local_data_source.dart';
import 'package:http/http.dart';

abstract class PaketRemoteDataSource {
  Future<List<PaketModel>> getPaket();
}

class PaketRemoteDataSourceImpl implements PaketRemoteDataSource {
  final LoginLocalDataSource localDataSource;
  final Client client;

  PaketRemoteDataSourceImpl({
    required this.localDataSource, 
    required this.client
  });
  @override
  Future<List<PaketModel>> getPaket() async{
    final token = await localDataSource.getCachedLoginData();
    final response = await client.get(
      Uri.http(url, '/api/paket'),
      headers: {
        'Authorization': 'Bearer ${token!.token}'
      }
    );
    if (response.statusCode == 200) {
      log(response.body.toString());
      return paketModelFromJson(response.body);
    } else {
      throw ServerException(error: errorFromJson(jsonDecode(response.body)));
    }
  }
}