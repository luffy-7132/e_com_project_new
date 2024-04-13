part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpLoaded extends SignUpState {
  final SignUpModel signUpModel;
  SignUpLoaded({required this.signUpModel});
}

final class SignUpError extends SignUpState {}
