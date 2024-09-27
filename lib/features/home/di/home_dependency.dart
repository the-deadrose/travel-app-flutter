import 'package:travel_app_flutter/config/injector/injector_config.dart';
import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/features/home/data/data_source/destination_remote_datasource.dart';
import 'package:travel_app_flutter/features/home/data/data_source/inspiration_remote_datasource.dart';
import 'package:travel_app_flutter/features/home/data/repositories/home_repository_impl.dart';
import 'package:travel_app_flutter/features/home/domain/usecases/get_destination_data.dart';
import 'package:travel_app_flutter/features/home/domain/usecases/get_inspiration_data.dart';
import 'package:travel_app_flutter/features/home/presentation/bloc/home_bloc.dart';

class HomeDepedency {
  HomeDepedency._();

  static void init() {
    getIt.registerLazySingleton(
      () => HomeBloc(
        getDestinationDataUseCase: getIt<GetDestinationDataUseCase>(),
        getInspirationDataUseCase: getIt<GetInspirationDataUseCase>(),
      ),
    );

    getIt.registerLazySingleton(() => GetDestinationDataUseCase(
          getIt<HomeRepositoryImpl>(),
        ));
    getIt.registerLazySingleton(() => GetInspirationDataUseCase(
          getIt<HomeRepositoryImpl>(),
        ));

    getIt.registerLazySingleton(() => HomeRepositoryImpl(
          homeRemoteDatasource: getIt<DestinationRemoteDatasource>(),
          inspirationRemoteDatasource: getIt<InspirationRemoteDatasource>(),
        ));

    getIt.registerLazySingleton<DestinationRemoteDatasource>(
      () => DestinationRemoteDatasourceImpl(getIt<ApiHelper>()),
    );

    getIt.registerLazySingleton<InspirationRemoteDatasource>(
      () => InspirationRemoteDatasourceImpl(getIt<ApiHelper>()),
    );

    getIt.registerLazySingleton(() => DestinationRemoteDatasourceImpl(
          getIt<ApiHelper>(),
        ));
    getIt.registerLazySingleton(() => InspirationRemoteDatasourceImpl(
          getIt<ApiHelper>(),
        ));
  }
}
