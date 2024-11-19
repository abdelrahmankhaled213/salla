import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerWidget extends StatelessWidget {

  final double height;
  final double width;
  final double? radius;
  final double? opacity;
  const ShimmerWidget({
    super.key
    ,required this.height,
    this.opacity,
    this.radius
    ,required this.width});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.primaryColor,
      highlightColor: AppColor.grey,
      enabled: true,
      direction: ShimmerDirection.ltr,

      child:  Container(
        height:height.h,
        width: width.w,
        decoration: BoxDecoration(
            color: AppColor.grey,
            border: Border.all(color: AppColor.primaryColor.withOpacity(opacity??0.1),),
            borderRadius: BorderRadius.circular(radius??0)
        ),

      ),
    );
  }
}