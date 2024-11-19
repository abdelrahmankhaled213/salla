import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/favouriteData.dart';
import 'package:ecommerce_app/features/Favourites/Ui/screens/FavouritesScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

Widget buildFavContainer(FavouriteData product) {
  return Slidable(
    startActionPane: ActionPane(motion: const ScrollMotion(), children: [
      SlidableAction(
        onPressed: (context) async {
        await deleteFavItem(product, context);
      },

        backgroundColor: AppColor.primaryColor,

        borderRadius: const BorderRadius.all(Radius.circular(15)),
        icon: Icons.delete,
      )
    ]),
    child: Container(
      height: 200.h,
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColor.primaryColor.withOpacity(0.3),
        ),


      ),
      child: Column(
        children: [

          CachedNetworkImage(
            height: 150.h,

            imageUrl: product.image,
            fit: BoxFit.cover,

            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),

          verticalSpace(5),

          SizedBox(
            width: 100.w,
            child: Text(product.name, style: AppStyle.regularPoppins13.copyWith(
                color: AppColor.darkGrey
            ),
              maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),

        ],
      ),
    ),
  );
}