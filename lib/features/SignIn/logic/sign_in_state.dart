part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState{

}
final class SignInLoaded extends SignInState{
final SignInResponse signInResponse;
SignInLoaded(this.signInResponse);
}

final class SignInFailure extends SignInState{

final String errorMsg;
SignInFailure({
  required this.errorMsg
});
}