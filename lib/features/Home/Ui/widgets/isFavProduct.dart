import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/features/Favourites/logic/favourite_cubit.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsFavProduct extends StatefulWidget {

  final Product product;

  const IsFavProduct({super.key, required this.product});

  @override
  State<IsFavProduct> createState() => _IsFavProductState();
}

class _IsFavProductState extends State<IsFavProduct> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<FavouriteCubit, FavouriteState>(

      buildWhen: (previous, current) {
        return (
            current is ChangeFavouriteLoaded ||
                current is ChangeFavouriteError ||
                current is ChangeFavouriteLoading);
      },

      builder: (context, state) {

        final favCubit = FavouriteCubit.get(context);

        if (state is ChangeFavouriteLoaded) {

          return
            Positioned(
              right: -10,
              top: -5,
              child: IconButton(

                  onPressed: () =>
                      favCubit.changeFavourite(widget.product.id)

                  , icon: Icon(
                favCubit.homeCubit.isFavorite[widget.product.id]! ? Icons
                    .favorite : Icons.favorite_border
                , color: AppColor.primaryColor
                , size: 25.sp,
              )
              ),
            );
        }


        return  Positioned(

          top: -5,

          right: -10,

          child: IconButton(onPressed: () =>

              favCubit.changeFavourite(widget.product.id)

              , icon: Icon(
                favCubit.homeCubit.isFavorite[widget.product.id]! ? Icons
                    .favorite : Icons.favorite_border
                , color: AppColor.primaryColor
                , size: 25.sp,
              )
          ),

        );
      },


    );
  }
}