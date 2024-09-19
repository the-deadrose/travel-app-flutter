import 'package:get_it/get_it.dart';
import 'package:travel_app_flutter/features/home/di/home_dependency.dart';

final getIt = GetIt.I;

void configureDepedencies() {
  HomeDepedency.init();
}
