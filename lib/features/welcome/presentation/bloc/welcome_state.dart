part of 'welcome_bloc.dart';

sealed class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

final class WelcomeInitial extends WelcomeState {}

final class WelcomeLoading extends WelcomeState {}

final class WelcomeLoaded extends WelcomeState {
  final WelcomeModel welcomeModel;

  const WelcomeLoaded(this.welcomeModel);

  @override
  List<Object> get props => [welcomeModel];
}

final class WelcomeError extends WelcomeState {
  final String message;

  const WelcomeError(this.message);

  @override
  List<Object> get props => [message];
}
