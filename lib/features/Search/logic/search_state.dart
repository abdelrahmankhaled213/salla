part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<Product> products;
  SearchLoaded({required this.products});
}

final class SearchFailure extends SearchState {
  final String msg;
  SearchFailure({required this.msg});
}
