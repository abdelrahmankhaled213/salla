import 'dart:developer';
import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Helpers/appRegex.dart';
import 'package:ecommerce_app/core/Helpers/appRegexClass.dart';
import 'package:ecommerce_app/core/Helpers/onRouting.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/core/widgets/CustomButton.dart';
import 'package:ecommerce_app/core/widgets/my_textform.dart';
import 'package:ecommerce_app/features/SignUp/Data/model/SignUpRequest.dart';
import 'package:ecommerce_app/features/SignUp/Ui/widgets/normalTextSpan.dart';
import 'package:ecommerce_app/features/SignUp/Ui/widgets/passwordValidation.dart';
import 'package:ecommerce_app/features/SignUp/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerContent extends StatefulWidget {

 const ContainerContent({super.key});

  @override
  State<ContainerContent> createState() => _ContainerContentState();
}

class _ContainerContentState extends State<ContainerContent>  {

 bool isObs=true;
 late TextEditingController nameEditingController;
 late TextEditingController emailEditingController;
 late TextEditingController passwordEditingController;
 late TextEditingController phoneEditingControlller;
 late AppRegexUpdates appRegexUpdates;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
nameEditingController=TextEditingController();

passwordEditingController=TextEditingController();
emailEditingController=TextEditingController();
phoneEditingControlller=TextEditingController();

appRegexUpdates=AppRegexUpdates();
    getCachedControllers();

  passwordEditingController.addListener(() {

setState(() {

 appRegexUpdates.minLength=AppRegex.hasMinLength(passwordEditingController.text);
 appRegexUpdates.isSpecialCharacter=AppRegex.hasSpecialCharacter(passwordEditingController.text);
 appRegexUpdates.  isUpperCase
   =AppRegex.hasUpperCase(passwordEditingController.text);
   appRegexUpdates.isLowerCase=AppRegex.hasLowerCase(passwordEditingController.text);
 appRegexUpdates.hasNumber= AppRegex.hasNumber(passwordEditingController.text);

});




    },
    );


   }

void assignValueToRegex() {

}

void getCachedControllers() {

  nameEditingController.text =
       getIt<CacheHelper>().getData(key: AppText.nameCache) ?? "";
  phoneEditingControlller.text =
       getIt<CacheHelper>().getData(key: AppText.phoneCache) ?? "";
  emailEditingController.text =
       getIt<CacheHelper>().getData(key: AppText.emailCache) ?? "";
  passwordEditingController.text =
       getIt<CacheHelper>().getData(key: AppText.passwordCache) ?? "";

}




@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameEditingController.dispose();
    phoneEditingControlller.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }


 @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 0),
      child: Form(

key: SignUpCubit.get(context).globalKey,

        child: ListView(
          children: [

            MyTextFormField(
          controller: nameEditingController
              , labelText: AppText.name,validator: (p0) =>validateName(p0),
              ),

            verticalSpace(8),

            MyTextFormField(
              controller: phoneEditingControlller,
                labelText: AppText.phoneNumber,validator: (p0) =>validatePhone(p0),

            ),

            verticalSpace(8),

            MyTextFormField(controller:emailEditingController
                , labelText: AppText.email,
            validator: (p0) =>validateEmail(p0)
            ),

            verticalSpace(8),

            MyTextFormField(controller: passwordEditingController
                , labelText: AppText.password
              ,obscureText: isObs
              ,validator: (p0) =>validatePassword(p0),
              icon: IconButton(onPressed: () =>changeEyeIcon()

              ,icon:  Icon(isObs?Icons.visibility:Icons.visibility_off,size: 21.sp,)),
            ),

            verticalSpace(8),

             PasswordValidationSignUp(
     appRegexUpdates: appRegexUpdates,
             ),

            verticalSpace(20),

            BlocConsumer<SignUpCubit,SignUpState>(

              builder: (context, state) {
                final cubit=SignUpCubit.get(context);

                if(state is SignUpLoading){
                  return const Center(
                      child:
                  CircularProgressIndicator()

                  );
                }
                return  CustomButton(
                    onPressed: () async=>
                   await isValidate(cubit),

                    text: AppText.signUpButton );
              },

              listener: (context, state) {
                if(state is SignUpLoaded){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.signUpResponse.message)));

                  if(state.signUpResponse.status==true) {
                    context.push(AppRouter.login);
                  }
                }
                if(state is SignUpError){
                  ScaffoldMessenger.of(context).showSnackBar
                    (SnackBar(content: Text(state.errorMsg)));
                }
              },

            ),

            verticalSpace(8),
NormalTextSpan(text: AppText.alreadyHaveAnAccount, text2: AppText.signIn
    , onTap:()=>context.pushReplacementNamed(AppRouter.login) )


          ],
        ),
      ),
    );
  }


changeEyeIcon(){
isObs=!isObs;
setState(() {

});
}

  String? validatePassword(String? p0) {
       if(p0!.isEmpty||!AppRegex.isPasswordValid(p0)){
    return AppText.pleaseEnterThePasswordAsFollows;
    }
    return null;
  }

  String? validateEmail(String? p0) {
     if(p0!.isEmpty||!AppRegex.isEmailValid(p0)){
      return AppText.pleaseEnterValidEmail;
    }
    return null;
  }

  String? validatePhone(String? p0) {
  if(p0!.isEmpty||!AppRegex.isPhoneNumberValid(p0)){
      return AppText.pleaseEnterYourPhoneRight;
    }
    return null;
  }

  String? validateName(String? p0) {
      if(p0!.isEmpty){
      return AppText.pleaseEnterYourName;
    }
    else if(p0.length<4){
      return AppText.theLengthOfTheNameIsTooShort;
    }
    return null;
  }

  Future<void> isValidate(SignUpCubit cubit) async {

await setCachedText();

    if(cubit.globalKey.currentState!.validate()){
      await cubit.signUp(
          SignUpRequest(
              name: nameEditingController.text
              ,
              password: passwordEditingController.text
              ,
              email: emailEditingController.text ,

              phone: phoneEditingControlller.text
          )
      );

    }



  }

setCachedText()async{
  await getIt<CacheHelper>().saveData(key: AppText.nameCache, value: nameEditingController.text);
 await getIt<CacheHelper>().saveData(key: AppText.phoneCache, value: phoneEditingControlller.text);
  await getIt<CacheHelper>().saveData(key: AppText.emailCache, value: emailEditingController.text);
  await getIt<CacheHelper>().saveData(key: AppText.passwordCache, value: passwordEditingController.text);

}
}
