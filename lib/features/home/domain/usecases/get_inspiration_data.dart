import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';
import 'package:travel_app_flutter/features/home/domain/repositories/home_repository.dart';

class GetInspirationDataUseCase {
  final HomeRepository _homeRepository;
  GetInspirationDataUseCase(this._homeRepository);

  Future<Either<Failure, InspirationModel>> call() async {
    return await _homeRepository.getInspirationData();
  }
}
