import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app_flutter/core/usecases/usecase.dart';
import 'package:travel_app_flutter/core/utils/failure_convertor.dart';
import 'package:travel_app_flutter/features/welcome/data/model/welcome_model.dart';
import 'package:travel_app_flutter/features/welcome/domain/usecases/get_welcome_data.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final GetWelcomeDataUseCase _getWelcomeDataUseCase;
  WelcomeBloc(this._getWelcomeDataUseCase) : super(WelcomeInitial()) {
    on<GetWelcomeData>(_getWelcomeData);
  }

  Future _getWelcomeData(GetWelcomeData event, Emitter emit) async {
    emit(WelcomeLoading());
    final response = await _getWelcomeDataUseCase.call(NoParams());

    response.fold(
      (l) => emit(WelcomeError(mapFailureToMessage(l))),
      (r) => emit(WelcomeLoaded(r)),
    );
  }
}
