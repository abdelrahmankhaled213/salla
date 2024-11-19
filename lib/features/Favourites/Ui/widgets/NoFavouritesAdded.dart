import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoFavouritesAdded extends StatelessWidget {
  const NoFavouritesAdded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Image.asset("assets/Png/bookmark.png",height: 100.h,),
          verticalSpace(5),
          Text("No Favourites Added",style: AppStyle.semiBoldPoppins18),
        ],
      ),
    );
  }
}