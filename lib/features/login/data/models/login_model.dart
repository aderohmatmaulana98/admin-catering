import 'package:cathering_mobile/features/login/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({required super.data, required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: LoginDataModel.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "data":LoginDataModel(
          id: data.id,
          username: data.username, 
          fullName: data.fullName, 
          alamat: data.alamat, 
          jenisKelamin: data.jenisKelamin, 
          noHp: data.noHp, 
          email: data.email, 
          roleId: data.roleId, 
          createdAt: data.createdAt, 
          updatedAt: data.updatedAt
        ).toJson(),
        "token": token,
    };
  
}

class LoginDataModel extends LoginData {
  const LoginDataModel({required super.id, required super.username, required super.fullName, required super.alamat, required super.jenisKelamin, required super.noHp, required super.email, required super.roleId, required super.createdAt, required super.updatedAt});
  
  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        id: json["id"],
        username: json["username"],
        fullName: json["full_name"],
        alamat: json["alamat"],
        jenisKelamin: json["jenis_kelamin"],
        noHp: json["no_hp"],
        email: json["email"],
        roleId: json["role_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "full_name": fullName,
        "alamat": alamat,
        "jenis_kelamin": jenisKelamin,
        "no_hp": noHp,
        "email": email,
        "role_id": roleId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
  
}