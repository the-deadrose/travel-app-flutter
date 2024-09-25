import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/features/welcome/data/data_source/welcome_remote_datasource.dart';
import 'package:travel_app_flutter/features/welcome/data/model/welcome_model.dart';
import 'package:travel_app_flutter/features/welcome/domain/repositories/welcome_repository.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  final WelcomeRemoteDatasourceImpl _welcomeRemoteDatasourceImpl;
  WelcomeRepositoryImpl(this._welcomeRemoteDatasourceImpl);
  @override
  Future<Either<Failure, WelcomeModel>> getWelcome() async {
    try {
      final response = await _welcomeRemoteDatasourceImpl.getWelcome();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
