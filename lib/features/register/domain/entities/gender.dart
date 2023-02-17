import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Gender extends Equatable {
  Gender({
    required this.value,
    required this.isActive,
  });

  final String value;
  bool isActive;

  @override
  List<Object?> get props => [
    value,
    isActive
  ];  
}
