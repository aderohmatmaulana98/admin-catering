import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Paket extends Equatable{
    Paket({
        required this.id,
        required this.namaPaket,
        required this.harga,
        required this.createdAt,
        required this.updatedAt,
        this.isActive = false
    });

    final int id;
    final String namaPaket;
    final int harga;
    bool isActive;
    final DateTime createdAt;
    final DateTime updatedAt;
    
      @override
      List<Object?> get props => [
        id,
        namaPaket,
        isActive,
        harga,
        createdAt,
        updatedAt
      ];
}
