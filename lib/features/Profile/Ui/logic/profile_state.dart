part of 'profile_cubit.dart';


sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileLoaded extends ProfileState {
  final ProfileEntity profileResponse;
  ProfileLoaded(this.profileResponse);
}
final class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}

final class ProfileUpdatedSuccess extends ProfileState {
  final String msg;
  ProfileUpdatedSuccess(this.msg);
}
final class ProfileUpdatedError extends ProfileState {
  final String error;
  ProfileUpdatedError(this.error);
}
