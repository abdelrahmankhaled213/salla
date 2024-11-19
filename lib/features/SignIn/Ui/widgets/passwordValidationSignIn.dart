import 'package:ecommerce_app/core/Helpers/appRegexClass.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';

import 'package:flutter/material.dart';

class PasswordValidationSignIn extends StatelessWidget {
  AppRegexUpdates appRegexUpdates ;
   PasswordValidationSignIn({super.key,required this.appRegexUpdates});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildValidationRow(text: "has at least 1 character"
              , hasValidated: appRegexUpdates.isSpecialCharacter),

          verticalSpace(2),

          buildValidationRow(text: "has at least 1 number"
              , hasValidated:appRegexUpdates.hasNumber),

          verticalSpace(2),

          buildValidationRow(text: "has at least 1 uppercase letter"
              , hasValidated:appRegexUpdates.isUpperCase),

          verticalSpace(2),

          buildValidationRow(text: "has at least 1 lowercase letter"
              , hasValidated:  appRegexUpdates.isLowerCase),

          verticalSpace(2),
          buildValidationRow(text: "has at least 8 characters long"
              ,  hasValidated: appRegexUpdates.minLength,),
        ],
      ),
    );


  }

  Widget buildValidationRow({required String text,required bool hasValidated}) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 3,
          backgroundColor: Colors.grey,
        ),
        horizontalSpace(6),
        Text(text,
          style: AppStyle.regularPoppins13.copyWith(

              decoration: hasValidated ? TextDecoration.lineThrough : TextDecoration.none,
              decorationThickness: 3.0,
              decorationColor: Colors.white,
              color:  AppColor.primaryColor
          ),
        ),
      ],
    );
  }
}