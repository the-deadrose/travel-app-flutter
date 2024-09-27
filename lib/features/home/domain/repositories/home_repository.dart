import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';
import 'package:travel_app_flutter/features/home/data/model/popular_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, DestinationModel>> getHome();
  Future<Either<Failure, InspirationModel>> getInspirationData();
  Future<Either<Failure, PopularModel>> getPopularData();
}
