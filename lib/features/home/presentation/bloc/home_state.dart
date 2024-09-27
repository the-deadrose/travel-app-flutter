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

  const HomeLoaded(
      {required this.inspirationModel, required this.destinationModel});

  @override
  List<Object> get props => [destinationModel, inspirationModel];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}
