import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/features/SignIn/Ui/widgets/customContainerSignIn.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignInScreenView extends StatelessWidget {
  const SignInScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 15.h),

        child: SafeArea(

          child: Stack(
alignment: Alignment.bottomCenter,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppText.signIn,style: AppStyle.semiBoldPoppins30,),

                  verticalSpace(2),

                  Text(AppText.heyThereWelcomeBack,
                    style: AppStyle.regularPoppins13,),

                  verticalSpace(60),

Text(AppText.hereAreYourDreamThings
    ,style: AppStyle.regularPoppins13.copyWith(
  fontSize: 18.sp
)
),
                  verticalSpace(20),

 const CustomContainerSignIn()

                ],
              ),

              Positioned(
                right: 0,
   top:55.h ,



                child: Image.asset
                  ("assets/Png/FTVA2-removebg-preview 1.png"
                  ,height: 203.h,),
              ),
            ],

          ),
        ),
      ),

    );
  }
}


