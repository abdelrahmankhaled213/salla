part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState{}
final class SignUpLoaded extends SignUpState{
  final SignUpResponse signUpResponse;
  SignUpLoaded({
    required this.signUpResponse
  });
}
final class SignUpError extends SignUpState{
  final String errorMsg;
  SignUpError({
    required this.errorMsg
});
}