import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:equatable/equatable.dart';

abstract class EMIState extends Equatable {
  const EMIState();

  @override
  List<Object?> get props => [];
}

class EMIInitial extends EMIState {}

class EMILoading extends EMIState {}

class EMILoaded extends EMIState {
  final EMIModel emiModel;
  const EMILoaded(this.emiModel);
}

class EMIError extends EMIState {
  final String? message;
  const EMIError(this.message);
}
