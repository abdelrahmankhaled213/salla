import 'package:ecommerce_app/core/Helpers/onRouting.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/favouriteData.dart';
import 'package:ecommerce_app/features/Favourites/Ui/widgets/NoFavouritesAdded.dart';
import 'package:ecommerce_app/features/Favourites/Ui/widgets/favContainer.dart';
import 'package:ecommerce_app/features/Favourites/logic/favourite_cubit.dart';
import 'package:ecommerce_app/features/Home/Ui/screens/homeScreenView.dart';
import 'package:ecommerce_app/features/SignIn/Ui/widgets/containerContentSignIn.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesScreenView extends StatelessWidget {

  const FavouritesScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {

    if(state is ChangeFavouriteLoaded){
      showSnackBar(context, state.addToFavouriteResponse.message);
    }
    else if(state is ChangeFavouriteError){
      showSnackBar(context, state.error, color: Colors.red);
    }
      },
      builder: (context, state) {

              if (state is GetFavouriteLoaded) {

                if(state.products.isEmpty){
                  return  const NoFavouritesAdded();
                }
                return Padding(
                  padding: EdgeInsets.only(top: 12.h,right: 12.w,left: 12.w),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => verticalSpace(12),
                    itemBuilder: (context, index) {
                      return buildFavContainer(
                          state.products[index]);
                    }, itemCount:  state.products.length,
                  ),
                );
              }

              else if (state is GetFavouriteError) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w)
                    ,child: DataError(errorMsg: state.error));
              }

              else {
                return loadingWidget();
              }

            },

    );
  }



}
Center loadingWidget() {

  return
    Center(
      child: Image.asset("assets/Png/Animation - 1720792156981.gif"
        ,fit: BoxFit.cover,
        height: 150.h,

      ),
    );
}





deleteFavItem(FavouriteData product, BuildContext context) async {
  await FavouriteCubit.get(context).changeFavourite(product.id);
}