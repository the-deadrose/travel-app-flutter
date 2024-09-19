import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/core/usecases/usecase.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/domain/repositories/home_repository.dart';

class GetHomeDataUseCase implements UseCase<void, NoParams> {
  final HomeRepository _homeRepository;
  GetHomeDataUseCase(this._homeRepository);
  @override
  Future<Either<Failure, DestinationModel>> call(NoParams noParams) async {
    return _homeRepository.getHome();
  }
}
