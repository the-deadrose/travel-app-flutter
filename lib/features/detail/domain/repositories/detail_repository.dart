import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/detail/data/model/detail_model.dart';

abstract class DetailRepository {
  Future<Either<Failure, DetailModel>> geDetail(int id);
}
