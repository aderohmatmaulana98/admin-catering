import 'dart:convert';

import 'package:cathering_mobile/core/error/exception.dart';
import 'package:cathering_mobile/core/utils/config.dart';
import 'package:cathering_mobile/features/login/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<LoginModel>? getCachedLoginData();
  Future<void> cachedLoginData(LoginModel loginModel);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences preferences;

  LoginLocalDataSourceImpl({required this.preferences});

  @override
  Future<void> cachedLoginData(LoginModel loginModel) {
    return preferences.setString(
      LOGIN_DATA_KEY,
      jsonEncode(loginModel.toJson())
    );
  }

  @override
  Future<LoginModel>? getCachedLoginData() {
    final jsonString = preferences.getString(LOGIN_DATA_KEY);
    if(jsonString != null){
      return Future.value(LoginModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException(message: 'Please check your internte connection');
    }
  }
  
}