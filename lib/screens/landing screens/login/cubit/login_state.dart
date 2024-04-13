part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginLoadedState extends LoginState {
  final LoginModel;
  LoginLoadedState({required this.LoginModel});
}

final class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState({required this.error});
}
