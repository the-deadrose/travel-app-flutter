import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:travel_app_flutter/core/errors/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
