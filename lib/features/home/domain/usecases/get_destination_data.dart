import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/domain/repositories/home_repository.dart';

class GetDestinationDataUseCase {
  final HomeRepository _homeRepository;
  GetDestinationDataUseCase(this._homeRepository);

  Future<Either<Failure, DestinationModel>> call() async {
    return await _homeRepository.getHome();
  }
}
