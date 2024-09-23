import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/usecases/usecase.dart';
import 'package:travel_app_flutter/core/utils/failure_convertor.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/domain/usecases/get_home_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase _getHomeDataUseCase;
  HomeBloc(this._getHomeDataUseCase) : super(HomeInitial()) {
    on<GetHomePageData>(_getHomePageData);
  }

  Future _getHomePageData(GetHomePageData event, Emitter emit) async {
    emit(HomeLoading());
    final response = await _getHomeDataUseCase.call(NoParams());

    response.fold(
      (l) => emit(HomeError(mapFailureToMessage(l))),
      (r) => emit(HomeLoaded(r)),
    );
  }
}
