import 'dart:developer';
import 'package:ecommerce_app/features/Favourites/Data/model/addToFavouriteResponse.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/favouriteData.dart';
import 'package:ecommerce_app/features/Favourites/Data/repo/favouriteRepo.dart';
import 'package:ecommerce_app/features/Home/logic/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {

  final FavouriteRepo favouriteRepo;

  final HomeCubit homeCubit;


  FavouriteCubit({required this.favouriteRepo,required this.homeCubit}) : super(FavouriteInitial());

  static FavouriteCubit get(context) => BlocProvider.of(context);

  getFavourites() async {

emit(GetFavouriteLoading());

  final result = await favouriteRepo.getFavourites();

if(isClosed) {
  return;
}
  result.fold((l) {
    emit(GetFavouriteError(l));
  }, (r) {

    emit(GetFavouriteLoaded(r));
  });
}

  changeFavourite(int productId) async {

    homeCubit.isFavorite[productId] = ! homeCubit.isFavorite[productId]!;

    emit(ChangeFavouriteLoading());

    final result = await favouriteRepo.changeFavourite(productId);

    if(isClosed) {
      return;
    }

    result.fold((l) {

      homeCubit.isFavorite[productId] = ! homeCubit.isFavorite[productId]!;

      emit(ChangeFavouriteError(l));
    }
    , (r) {

      if(!r.status){

        homeCubit.isFavorite[productId] = ! homeCubit.isFavorite[productId]!;
        emit(ChangeFavouriteLoading());
      }
else {
        getFavourites();
      }

      emit(ChangeFavouriteLoaded(r));
      log("emit change favourite");
    });

  }



}
