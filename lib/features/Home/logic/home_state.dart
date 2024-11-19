part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
final List<CategoryData> categoryData;
  HomeLoaded(this.categoryData);
}

final class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}

final class HomeIsMore extends HomeState {}