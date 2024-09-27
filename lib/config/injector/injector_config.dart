import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_app_flutter/core/api/api_helper.dart';
import 'package:travel_app_flutter/core/api/api_interceptor.dart';
import 'package:travel_app_flutter/features/detail/di/detail_dependency.dart';
import 'package:travel_app_flutter/features/home/di/home_dependency.dart';
import 'package:travel_app_flutter/features/welcome/di/welcome_dependency.dart';

final getIt = GetIt.I;

void configureDepedencies() {
  WelcomeDepedency.init();
  HomeDepedency.init();
  DetailDependency.init();

  getIt.registerLazySingleton(
    () => ApiHelper(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton(
    () => Dio(BaseOptions(
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
    ))
      ..interceptors.add(
        getIt<ApiInterceptor>(),
      ),
  );

  getIt.registerLazySingleton(
    () => ApiInterceptor(),
  );
}
