part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class PostRegisterEvent extends RegisterEvent {
  final String userame;
  final String password;
  final String name;
  final String phone;
  final String address;
  final String email;
  final String gender;

  const PostRegisterEvent({
    required this.userame, 
    required this.password, 
    required this.name, 
    required this.phone, 
    required this.address, 
    required this.email, 
    required this.gender
  });
}
