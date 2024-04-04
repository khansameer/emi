import 'package:emi_calculation/screen/dashboard/model/emi_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final EMIModel emiModel;
  const LoginLoaded(this.emiModel);
}

class LoginError extends LoginState {
  final String? message;
  const LoginError(this.message);
}
