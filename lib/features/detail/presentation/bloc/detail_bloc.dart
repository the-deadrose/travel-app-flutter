import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app_flutter/features/detail/data/model/detail_model.dart';
import 'package:travel_app_flutter/features/detail/domain/usecases/get_detail_data.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetailDataUseCase getDetailDataUseCase;
  DetailBloc({required this.getDetailDataUseCase}) : super(DetailInitial()) {
    on<GetDetailData>((event, emit) async {
      emit(DetailLoading());

      final detail = await getDetailDataUseCase(event.id);

      detail.fold(
        (failure) =>
            emit(const DetailError(message: 'failed to load detail data')),
        (detail) => emit(DetailLoaded(detailModel: detail)),
      );
    });
  }
}
