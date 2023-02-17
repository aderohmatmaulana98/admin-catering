import 'dart:convert';

import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/error/model/error.dart';
import 'package:cathering_mobile/core/utils/config.dart';
import 'package:http/http.dart';

abstract class RegisterRemoteDataSource {
  Future<void>? postRegister({
  required final String userame,
  required final String password,
  required final String name,
  required final String phone,
  required final String address,
  required final String email,
  required final String gender,
  });
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final Client client;

  RegisterRemoteDataSourceImpl({required this.client});

  @override
  Future<void> postRegister({required String userame, required String password, required String name, required String phone, required String address, required String email, required String gender}) async {
    final response = await client.post(
      Uri.http(url, '/api/auth/register'),
      body: {
        'username': userame,
        'password': password,
        'fullName': name,
        'noHp': phone,
        'jenisKelamin': gender,
        'email': email,
        'roleId': '2',
        'alamat': address
      }
    );
    if(response.statusCode != 200){
      throw ServerException(error: ErrorModel.fromJson(jsonDecode(response.body)));
    }
  }
}