import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/welcome/data/model/welcome_model.dart';

abstract class WelcomeRepository {
  Future<Either<Failure, WelcomeModel>> getWelcome();
}
