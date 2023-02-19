import 'dart:convert';

import 'package:cathering_mobile/features/beranda/domain/entities/paket.dart';

  List<PaketModel> paketModelFromJson(String str) => List<PaketModel>.from(json.decode(str).map((x) => PaketModel.fromJson(x)));

  String paketModelToJson(List<PaketModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// ignore: must_be_immutable
class PaketModel extends Paket {
  PaketModel({required super.id, required super.namaPaket, required super.harga, required super.createdAt, required super.updatedAt, super.isActive});
  
  factory PaketModel.fromJson(Map<String, dynamic> json) => PaketModel(
        id: json["id"],
        namaPaket: json["nama_paket"],
        harga: json["harga"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_paket": namaPaket,
        "harga": harga,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}