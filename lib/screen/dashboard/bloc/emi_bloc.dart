import 'package:emi_calculation/api/api_repository.dart';
import 'package:emi_calculation/screen/dashboard/bloc/dashboard_event.dart';
import 'package:emi_calculation/screen/dashboard/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EMIBloc extends Bloc<EMIEvent, EMIState> {
  EMIBloc() : super(EMIInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetEMIList>((event, emit) async {
      try {
        emit(EMILoading());
        final mList = await apiRepository.fetchEMIData();
        emit(EMILoaded(mList));

        if (mList.error != null) {
          emit(EMIError(mList.error));
        }
      } on NetworkError {
        emit(const EMIError("Failed to fetch data. is your device online?"));
      }
    });
  }
}