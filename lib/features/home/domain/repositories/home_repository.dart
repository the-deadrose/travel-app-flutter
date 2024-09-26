import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, DestinationModel>> getHome();
  Future<Either<Failure, InspirationModel>> getInspirationData();
}
