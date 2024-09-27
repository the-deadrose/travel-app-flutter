import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/usecases/usecase.dart';
import 'package:travel_app_flutter/core/utils/failure_convertor.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';
import 'package:travel_app_flutter/features/home/domain/usecases/get_destination_data.dart';
import 'package:travel_app_flutter/features/home/domain/usecases/get_inspiration_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDestinationDataUseCase getDestinationDataUseCase;
  final GetInspirationDataUseCase getInspirationDataUseCase;

  HomeBloc(
      {required this.getDestinationDataUseCase,
      required this.getInspirationDataUseCase})
      : super(HomeInitial()) {
    on<GetHomePageData>((event, emit) async {
      emit(HomeLoading());

      final destination = await getDestinationDataUseCase();
      final inspiration = await getInspirationDataUseCase();
      destination.fold(
        (failure) =>
            emit(const HomeError(message: 'failed to load destination data')),
        (destination) => inspiration.fold(
            (failure) => emit(
                const HomeError(message: 'failed to load inspiration data')),
            (inspiration) => emit(HomeLoaded(
                destinationModel: destination, inspirationModel: inspiration))),
      );
    });
  }

  // Future _getHomePageData(GetHomePageData event, Emitter emit) async {
  //   emit(HomeLoading());
  //   final response = await _getHomeDataUseCase.call(NoParams());

  //   print('response is $response');

  //   response.fold(
  //     (l) => emit(HomeError(mapFailureToMessage(l))),
  //     (r) => emit(HomeLoaded(r)),
  //   );
  // }

  // Future _getInspirationData(GetInspirationData event, Emitter emit) async {
  //   emit(InspirationLoading());
  //   final response = await _getInspirationDataUseCase.call(NoParams());

  //   print('response inspiration is $response');

  //   response.fold(
  //     (l) => emit(InspirationError(mapFailureToMessage(l))),
  //     (r) => emit(InspirationLoaded(r)),
  //   );
  // }
}
