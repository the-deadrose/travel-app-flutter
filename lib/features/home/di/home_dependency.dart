import 'package:travel_app_flutter/config/injector/injector_config.dart';
import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/features/home/data/data_source/home_remote_datasource.dart';
import 'package:travel_app_flutter/features/home/data/repositories/home_repository_impl.dart';
import 'package:travel_app_flutter/features/home/domain/usecases/get_home_data.dart';
import 'package:travel_app_flutter/features/home/domain/usecases/get_inspiration_data.dart';
import 'package:travel_app_flutter/features/home/presentation/bloc/home_bloc.dart';

class HomeDepedency {
  HomeDepedency._();

  static void init() {
    getIt.registerLazySingleton(
      () => HomeBloc(
        getIt<GetHomeDataUseCase>(),
        getIt<GetInspirationDataUseCase>(),
      ),
    );

    getIt.registerLazySingleton(() => GetHomeDataUseCase(
          getIt<HomeRepositoryImpl>(),
        ));
    getIt.registerLazySingleton(() => GetInspirationDataUseCase(
          getIt<HomeRepositoryImpl>(),
        ));

    getIt.registerLazySingleton(() => HomeRepositoryImpl(
          getIt<HomeRemoteDatasourceImpl>(),
        ));

    getIt.registerLazySingleton(() => HomeRemoteDatasourceImpl(
          getIt<ApiHelper>(),
        ));
  }
}
