part of 'paket_bloc.dart';

abstract class PaketEvent extends Equatable {
  const PaketEvent();

  @override
  List<Object> get props => [];
}

class GetPaketEvent extends PaketEvent {
  
}