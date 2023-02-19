part of 'paket_bloc.dart';

abstract class PaketState extends Equatable {
  const PaketState();
  
  @override
  List<Object> get props => [];
}

class PaketInitial extends PaketState {}

class PaketLoaded extends PaketState {
  final List<Paket> paket;

  const PaketLoaded(this.paket);
}

class PaketFailed extends PaketState {
  final ErrorModel errorModel;

  const PaketFailed(this.errorModel);
}

class PaketLoading extends PaketState {
  
}
