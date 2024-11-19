import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Helpers/appRegex.dart';
import 'package:ecommerce_app/core/Helpers/appRegexClass.dart';
import 'package:ecommerce_app/core/Helpers/onRouting.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/core/widgets/CustomButton.dart';
import 'package:ecommerce_app/core/widgets/my_textform.dart';
import 'package:ecommerce_app/features/SignIn/Data/model/SignInRequest.dart';
import 'package:ecommerce_app/features/SignIn/Ui/widgets/passwordValidationSignIn.dart';
import 'package:ecommerce_app/features/SignIn/logic/sign_in_cubit.dart';
import 'package:ecommerce_app/features/SignUp/Ui/widgets/normalTextSpan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerContentSignIn extends StatefulWidget {

  const ContainerContentSignIn({super.key});

  @override
  State<ContainerContentSignIn> createState() => _ContainerContentState();
}

class _ContainerContentState extends State<ContainerContentSignIn> {

  bool isObs = true;


  late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController phoneEditingControlller;
late  AppRegexUpdates appRegexUpdates;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameEditingController=TextEditingController();
    passwordEditingController=TextEditingController();
    emailEditingController=TextEditingController();
    phoneEditingControlller=TextEditingController();
    appRegexUpdates=AppRegexUpdates();

    passwordEditingController.addListener(() {

      setState(() {

      });


      appRegexUpdates.minLength= AppRegex.hasMinLength(passwordEditingController.text);
      appRegexUpdates.isSpecialCharacter= AppRegex.hasSpecialCharacter(passwordEditingController.text);
      appRegexUpdates.isUpperCase= AppRegex.hasUpperCase(passwordEditingController.text);
      appRegexUpdates.isLowerCase= AppRegex.hasLowerCase(passwordEditingController.text);
      appRegexUpdates.hasNumber= AppRegex.hasNumber(passwordEditingController.text);

    },
    );


  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 0),




      child: Form(

        key: SignInCubit.get(context).globalKey,

        child: ListView(
          children: [


            MyTextFormField(controller: emailEditingController

                , labelText: AppText.email,

                validator: (p0) =>validateEmail(p0)

            ),

            verticalSpace(8),

            MyTextFormField(controller: passwordEditingController,
              labelText: AppText.password
              ,obscureText: isObs
              ,validator: (p0) =>validatePassword(p0),
              icon: IconButton(onPressed: () =>changeEyeIcon()

                  ,icon:  Icon(isObs?Icons.visibility:Icons.visibility_off,size: 21.sp,)),
            ),

            verticalSpace(8),

             PasswordValidationSignIn(
               appRegexUpdates: appRegexUpdates,
             ),

            verticalSpace(20),

            BlocConsumer<SignInCubit,SignInState>(

              builder: (context, state) {

                final cubit=SignInCubit.get(context);

                if(state is SignInLoading){
                  return  const Center(
                      child:
                      CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      )

                  );
                }
                return  CustomButton(
                    onPressed: () async=>
                    await isValidate(cubit),

                    text: AppText.signIn );
              },

              listener: (context, state) async {
                if(state is SignInLoaded){

                  showSnackBar(context, state.signInResponse.message??"");
                  if(state.signInResponse.status){

                    context.pushReplacementNamed(AppRouter.homeLayout);
                  }
                }
                if(state is SignInFailure){
                showSnackBar(context, state.errorMsg);
                }
              },

            ),

            verticalSpace(8),

            NormalTextSpan(text: AppText.alreadyHaveAnAccount, text2: AppText.signUp
                , onTap:()=>context.pushReplacementNamed(AppRouter.signUp) )

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


  Future<void> isValidate(SignInCubit cubit) async {

    if(cubit.globalKey.currentState!.validate()){
      await cubit.login(
          SignInRequest(

            password: passwordEditingController.text
            ,
            email:emailEditingController .text,

          )
      );

    }
  }
}
void showSnackBar(BuildContext context, String text, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        animation: const AlwaysStoppedAnimation(6.0)
        ,elevation: 15,backgroundColor: color??Colors.grey,));
}