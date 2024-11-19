part of 'favourite_cubit.dart';

sealed class FavouriteState {

}

final class FavouriteInitial extends FavouriteState {

}

final class ChangeFavouriteLoading extends FavouriteState {

}
final class ChangeFavouriteLoaded extends FavouriteState {

   final AddOrRemoveResponse addToFavouriteResponse;

  ChangeFavouriteLoaded(this.addToFavouriteResponse);
}

final class ChangeFavouriteError extends FavouriteState {
  final String error;
  ChangeFavouriteError(this.error);
}
final class GetFavouriteLoading extends FavouriteState {

}
final class GetFavouriteLoaded extends FavouriteState {
  final List<FavouriteData> products;
  GetFavouriteLoaded(this.products);
}
final class GetFavouriteError extends FavouriteState {
  final String error;
  GetFavouriteError(this.error);
}


