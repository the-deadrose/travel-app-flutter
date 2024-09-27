import 'package:travel_app_flutter/config/injector/injector_config.dart';
import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/features/detail/data/data_source/detail_remote_datasource.dart';
import 'package:travel_app_flutter/features/detail/data/repository/detail_repository_impl.dart';
import 'package:travel_app_flutter/features/detail/domain/usecases/get_detail_data.dart';
import 'package:travel_app_flutter/features/detail/presentation/bloc/detail_bloc.dart';

class DetailDependency {
  DetailDependency._();

  static void init() {
    getIt.registerLazySingleton(() => DetailBloc(
          getDetailDataUseCase: getIt<GetDetailDataUseCase>(),
        ));

    getIt.registerLazySingleton(() => GetDetailDataUseCase(
          getIt<DetailRepositoryImpl>(),
        ));

    getIt.registerLazySingleton<DetailRemoteDatasource>(
        () => DetailRemoteDatasourceImpl(getIt<ApiHelper>()));

    getIt.registerLazySingleton(() => DetailRepositoryImpl(
          detailRemoteDatasource: getIt<DetailRemoteDatasource>(),
        ));
  }
}
