import 'package:ecommerce_app/features/SignUp/Ui/widgets/containerContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerSignUp extends StatelessWidget {
  const CustomContainerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
            bottom: 8.h,
          top: 15.h
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(22.r),
              topLeft: Radius.circular(22.r),
            ),
            color: Colors.white
        ),
        child: const ContainerContent(),
      ),
    );
  }
}