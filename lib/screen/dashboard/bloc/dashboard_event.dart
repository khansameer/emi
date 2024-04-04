import 'package:equatable/equatable.dart';

abstract class EMIEvent extends Equatable {
  const EMIEvent();

  @override
  List<Object> get props => [];
}

class GetEMIList extends EMIEvent {}
