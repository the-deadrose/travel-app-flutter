import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/exception.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/home/data/data_source/destination_remote_datasource.dart';
import 'package:travel_app_flutter/features/home/data/data_source/inspiration_remote_datasource.dart';
import 'package:travel_app_flutter/features/home/data/data_source/popular_remote_datasource.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';
import 'package:travel_app_flutter/features/home/data/model/popular_model.dart';
import 'package:travel_app_flutter/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final DestinationRemoteDatasource homeRemoteDatasource;
  final InspirationRemoteDatasource inspirationRemoteDatasource;
  final PopularRemoteDatasource popularRemoteDatasource;

  HomeRepositoryImpl({
    required this.homeRemoteDatasource,
    required this.inspirationRemoteDatasource,
    required this.popularRemoteDatasource,
  });

  @override
  Future<Either<Failure, DestinationModel>> getHome() async {
    try {
      final response = await homeRemoteDatasource.getDestination();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InspirationModel>> getInspirationData() async {
    try {
      final response = await inspirationRemoteDatasource.getInspirations();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PopularModel>> getPopularData() async {
    try {
      final response = await popularRemoteDatasource.getPopular();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
