part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final DestinationModel destinationModel;
  final InspirationModel inspirationModel;
  final PopularModel popularModel;

  const HomeLoaded(
      {required this.inspirationModel,
      required this.destinationModel,
      required this.popularModel});

  @override
  List<Object> get props => [destinationModel, inspirationModel, popularModel];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}
