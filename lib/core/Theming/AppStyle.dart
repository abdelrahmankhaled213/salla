import 'package:ecommerce_app/core/Helpers/fontWeightHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyle{

static TextStyle semiBoldPoppins30=TextStyle(
  color: Colors.white,
  fontSize: 30.sp,
  fontFamily: 'Poppins',
  fontWeight: FontWeightHelper.semiBold
);
static TextStyle regularPoppins13=TextStyle(
    color: Colors.white,
    fontSize: 13.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeightHelper.regular
);
static TextStyle semiBoldPoppins15=TextStyle(
  color: Colors.white,
    fontSize: 15.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeightHelper.semiBold
);
static TextStyle semiBoldPoppins18=TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeightHelper.semiBold
);
static TextStyle regularPacifico40=TextStyle(
    color: Colors.white,
    fontSize: 40.sp,
    fontFamily: 'Pacifico',
    fontWeight: FontWeightHelper.regular
);
}