import 'package:ecommerce_app/core/Helpers/appRegexClass.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/features/SignUp/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';


class PasswordValidationSignUp extends StatelessWidget {
late AppRegexUpdates appRegexUpdates;
 PasswordValidationSignUp({
   super.key

   ,required this.appRegexUpdates

});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildValidationRow(text: AppText.validationSpecialCharacter
              , hasValidated: appRegexUpdates.isSpecialCharacter),

          verticalSpace(2),

          buildValidationRow(text: AppText.validationNumber
              , hasValidated:appRegexUpdates.hasNumber),

          verticalSpace(2),

          buildValidationRow(text: AppText.validationUpperCase
              , hasValidated:appRegexUpdates.isUpperCase),

          verticalSpace(2),

          buildValidationRow(text: AppText.validationLowerCase
              , hasValidated:appRegexUpdates.isLowerCase),

          verticalSpace(2),
          buildValidationRow(text: AppText.validationTextLength
              , hasValidated: appRegexUpdates.minLength,),
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