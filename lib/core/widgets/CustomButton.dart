import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theming/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final Color? color;
  final String text;
  final double? radius;
  final double? height;
  final double? width;

   CustomButton({Key? key
    ,this.height
     , required this.onPressed
     , this.radius
     , required this.text
     ,this.color,
      this.width
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height:height?.h?? 49.h,
        width: width?.w??215.w,

        decoration:  BoxDecoration(
          borderRadius:  BorderRadius.circular(radius??10.r),
          gradient: const LinearGradient(
            colors:   [
            Color(0xff5A5A5A),
              AppColor.primaryColor,
            // Colors.black
          ],
          ),


        ),
        child: Center(child: Text(text,style: AppStyle.semiBoldPoppins15,)),

    )
    );}
}
