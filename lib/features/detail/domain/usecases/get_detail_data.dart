import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/detail/data/model/detail_model.dart';
import 'package:travel_app_flutter/features/detail/domain/repositories/detail_repository.dart';

class GetDetailDataUseCase {
  final DetailRepository _detailRepository;
  GetDetailDataUseCase(this._detailRepository);

  Future<Either<Failure, DetailModel>> call(int id) async {
    return await _detailRepository.geDetail(id);
  }
}
