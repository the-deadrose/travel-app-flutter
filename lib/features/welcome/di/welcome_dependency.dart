import 'package:travel_app_flutter/config/injector/injector_config.dart';
import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/features/welcome/data/data_source/welcome_remote_datasource.dart';
import 'package:travel_app_flutter/features/welcome/data/repository/welcome_repository_impl.dart';
import 'package:travel_app_flutter/features/welcome/domain/usecases/get_welcome_data.dart';
import 'package:travel_app_flutter/features/welcome/presentation/bloc/welcome_bloc.dart';

class WelcomeDepedency {
  WelcomeDepedency._();

  static void init() {
    getIt.registerLazySingleton(
      () => WelcomeBloc(
        getIt<GetWelcomeDataUseCase>(),
      ),
    );

    getIt.registerLazySingleton(() => GetWelcomeDataUseCase(
          getIt<WelcomeRepositoryImpl>(),
        ));

    getIt.registerLazySingleton(() => WelcomeRepositoryImpl(
          getIt<WelcomeRemoteDatasourceImpl>(),
        ));

    getIt.registerLazySingleton(() => WelcomeRemoteDatasourceImpl(
          getIt<ApiHelper>(),
        ));
  }
}
