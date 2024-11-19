import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NormalTextSpan extends StatelessWidget {
  final String text;
  final String text2;
  final void Function() onTap;
  NormalTextSpan({required this.text, required this.text2,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
            children: [
              TextSpan(
                  text: text+'\t',
                  style: AppStyle.regularPoppins13.copyWith(
                    color: Colors.black
                  )
              ),
              TextSpan(
                  text: text2,
                  style: AppStyle.regularPoppins13.copyWith(
                    color: AppColor.grey
                  ),
                  recognizer: TapGestureRecognizer()..onTap = onTap
              ),
            ]
        )
    );
  }
}