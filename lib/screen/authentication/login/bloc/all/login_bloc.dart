import 'package:emi_calculation/api/api_repository.dart';
import 'package:emi_calculation/screen/authentication/login/bloc/all/login_event.dart';
import 'package:emi_calculation/screen/authentication/login/bloc/all/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    // on<GetEMIList>((event, emit) async {
    //   try {
    //     emit(EMILoading());
    //     final mList = await apiRepository.fetchEMIData();
    //     emit(EMILoaded(mList));
    //
    //     if (mList.error != null) {
    //       emit(EMIError(mList.error));
    //     }
    //   } on NetworkError {
    //     emit(const EMIError("Failed to fetch data. is your device online?"));
    //   }
    // });
  }
}
