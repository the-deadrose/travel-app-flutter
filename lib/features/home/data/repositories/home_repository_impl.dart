import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/home/data/data_source/home_remote_datasource.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _homeRemoteDatasource;

  HomeRepositoryImpl(this._homeRemoteDatasource);

  @override
  Future<Either<Failure, DestinationModel>> getHome() async {
    try {
      final response = await _homeRemoteDatasource.getHome();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
