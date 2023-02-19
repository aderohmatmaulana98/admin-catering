import 'dart:convert';

import 'package:equatable/equatable.dart';

ErrorModel errorFromJson(String str) => ErrorModel.fromJson(jsonDecode(str));

class ErrorModel extends Equatable{

    factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json["message"] is List ? json['message'].first : json["message"],
        error: json["error"],
    );
    const ErrorModel({
        this.message,
        this.error,
    });

    final dynamic message;
    final String? error;
    
    @override
    List<Object?> get props => [
      message,
      error
    ];
}
