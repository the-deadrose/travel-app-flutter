import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/core/usecases/usecase.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';
import 'package:travel_app_flutter/features/home/domain/repositories/home_repository.dart';

class GetInspirationDataUseCase implements UseCase<void, NoParams> {
  final HomeRepository _homeRepository;
  GetInspirationDataUseCase(this._homeRepository);
  @override
  Future<Either<Failure, InspirationModel>> call(NoParams noParams) async {
    return _homeRepository.getInspirationData();
  }
}
