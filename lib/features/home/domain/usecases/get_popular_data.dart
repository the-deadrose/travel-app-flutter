import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/home/data/model/popular_model.dart';
import 'package:travel_app_flutter/features/home/domain/repositories/home_repository.dart';

class GetPopularDataUseCase {
  final HomeRepository _homeRepository;
  GetPopularDataUseCase(this._homeRepository);

  Future<Either<Failure, PopularModel>> call() async {
    return await _homeRepository.getPopularData();
  }
}
