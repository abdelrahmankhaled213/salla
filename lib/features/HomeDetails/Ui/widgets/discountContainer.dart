import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget discountContainer(num discount) {
  return Container(
      height: 20.h,

      width: 40.w,

      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          colors:   [
            Color(0xff5A5A5A),
            Colors.black
          ],
        ),
      ),
    child: Text(
      textAlign: TextAlign.center
      ,"$discount %"
      ,style: AppStyle.regularPoppins13.copyWith(color: Colors.white),),
  );
}