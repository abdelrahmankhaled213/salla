import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {

final EdgeInsetsGeometry? contentPadding;
final TextEditingController? controller;
final InputBorder? enabledBorder;
final InputBorder?focusedBorder;
final  TextStyle? hintStyle;
final bool? obscureText;
final String labelText;
final Widget? icon;
final Color? backGroundColor;
final String? Function(String?)? validator;
 final void Function(String?) ? onChange;
 final FocusNode? focusNode;

const MyTextFormField({
  this.backGroundColor,
  required this.controller,
  required this.labelText,
  this.onChange,
  this.icon,
  this.contentPadding,
  this.enabledBorder,
  this.focusedBorder,
  this.obscureText,
  this.hintStyle,
  this.validator,
  this.focusNode
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
height:60.h ,
      child: TextFormField(
        onChanged: onChange,
        validator: validator,
controller: controller,
        decoration: InputDecoration(
          isDense: true,
          label: Text(labelText,style: AppStyle.regularPoppins13.copyWith(
            color: AppColor.primaryColor
          ),),
          filled: backGroundColor == null ? false : true,
          fillColor: backGroundColor,
          contentPadding: contentPadding ?? EdgeInsets.symmetric(
              horizontal: 20.w,vertical: 10.h),
          enabledBorder: enabledBorder??
           OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.lightGrey
            ),
            borderRadius: BorderRadius.circular(16)
          ),
          focusedBorder: focusedBorder ??OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColor.primaryColor,
                width: 1.3,

            ),
              borderRadius: BorderRadius.circular(16),
          ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
      color: Colors.red,
      width: 1.3
        ),

        borderRadius: BorderRadius.circular(16)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
      color: Colors.red,
      width: 1.3
        ),
        borderRadius: BorderRadius.circular(16)
      ),

      suffixIcon: icon
        ),

      obscureText: obscureText ?? false,
focusNode: focusNode??null,

        style: AppStyle.semiBoldPoppins15.copyWith(
          color: Colors.black
        ),
      ),
    );
  }

}

