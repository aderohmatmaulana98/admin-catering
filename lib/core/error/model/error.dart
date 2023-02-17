import 'dart:convert';

import 'package:equatable/equatable.dart';

ErrorModel errorFromJson(String str) => ErrorModel.fromJson(jsonDecode(str));

class ErrorModel extends Equatable{

    factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        statusCode: json["statusCode"],
        message: json["message"] is List ? json['message'].first : json["message"],
        error: json["error"],
    );
    const ErrorModel({
        this.statusCode,
        this.message,
        this.error,
    });

    final int? statusCode;
    final dynamic message;
    final String? error;
    
    @override
    List<Object?> get props => [
      statusCode,
      message,
      error
    ];
}
