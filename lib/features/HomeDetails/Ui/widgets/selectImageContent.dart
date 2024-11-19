import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/HomeDetails/logic/home_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Theming/colors.dart';

class SelectImageContent extends StatelessWidget {
  const SelectImageContent({
    super.key,
    required this.productImages,
  });

  final String productImages;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BlocBuilder<HomeDetailsCubit, HomeDetailsState>(

        builder: (context, state) {

          final homeDetailsCubit = HomeDetailsCubit.get(context);
          return Container(
            height: 80.h,
            decoration: BoxDecoration(
              border: homeDetailsCubit.selectedImage == productImages  ? null : Border.all(
                  color: AppColor.primaryColor

              ),
            ),
            child: Opacity(
              opacity: HomeDetailsCubit
                  .get(context)
                  .selectedImage == productImages ?
              1 : 0.3
              ,
              child: GestureDetector(
                onTap: () {
                  homeDetailsCubit.selectedProductImage(
                      productImages);
                },
                child: CachedNetworkImage(
                  height: 60.h,
                  width: 80.w,
                  imageUrl: productImages
                  ,
                  errorWidget: (context, url, error) =>
                  const Icon(
                      Icons.error),),
              ),

            ),
          );
        },
      ),
    );
  }
}
