import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerCarousel extends StatelessWidget {

  const ContainerCarousel({super.key,required this.banner});

  final Banners banner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136.h,
      width: 319.w,

      child: ClipRRect(
        borderRadius:  BorderRadius.circular(15.r),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: banner.image??"",
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),

    );
  }
}