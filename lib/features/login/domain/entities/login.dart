import 'package:equatable/equatable.dart';

class Login extends Equatable{
  const Login({
    required this.data, 
    required this.token,
  });

  final LoginData data;
  final String token;
  
  @override
  List<Object?> get props => [data, token];
}


class LoginData extends Equatable {
  const LoginData({
    required this.id, 
    required this.username, 
    required this.fullName, 
    required this.alamat, 
    required this.jenisKelamin, 
    required this.noHp, 
    required this.email, 
    required this.roleId, 
    required this.createdAt, 
    required this.updatedAt,
  });

  final int id;
  final String username;
  final String fullName;
  final String alamat;
  final String jenisKelamin;
  final String noHp;
  final String email;
  final int roleId;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
    id,
    username,
    fullName,
    alamat,
    jenisKelamin,
    noHp,
    email,
    roleId,
    createdAt,
    updatedAt
  ];
  
}
