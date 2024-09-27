import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/detail/data/data_source/detail_remote_datasource.dart';
import 'package:travel_app_flutter/features/detail/data/model/detail_model.dart';
import 'package:travel_app_flutter/features/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDatasource detailRemoteDatasource;

  DetailRepositoryImpl({required this.detailRemoteDatasource});
  @override
  Future<Either<Failure, DetailModel>> geDetail(int id) async {
    try {
      final result = await detailRemoteDatasource.getDetail(id);
      return Right(result);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
