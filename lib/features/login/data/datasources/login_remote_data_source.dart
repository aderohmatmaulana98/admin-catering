import 'dart:convert';

import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/error/model/error.dart';
import 'package:cathering_mobile/core/utils/config.dart';
import 'package:cathering_mobile/features/login/data/models/login_model.dart';
import 'package:http/http.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel>? postLogin(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Client client;

  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel>? postLogin(String username, String password) async {
    final response = await client.post(
      Uri.http(url, '/api/auth/login'),
      body: {
        'username': username,
        'password': password
      }
    );

    if(response.statusCode == 200){
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(error: ErrorModel.fromJson(jsonDecode(response.body)));
    }
  }
  
}