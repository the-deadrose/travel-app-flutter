import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';
import 'package:travel_app_flutter/core/usecases/usecase.dart';
import 'package:travel_app_flutter/features/welcome/data/model/welcome_model.dart';
import 'package:travel_app_flutter/features/welcome/domain/repositories/welcome_repository.dart';

class GetWelcomeDataUseCase implements UseCase<void, NoParams> {
  final WelcomeRepository _welcomeRepository;
  GetWelcomeDataUseCase(this._welcomeRepository);
  @override
  Future<Either<Failure, WelcomeModel>> call(NoParams params) async {
    return _welcomeRepository.getWelcome();
  }
}
