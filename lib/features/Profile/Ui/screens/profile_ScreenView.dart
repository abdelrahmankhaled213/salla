import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Helpers/appRegex.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/core/widgets/my_textform.dart';
import 'package:ecommerce_app/features/Home/Ui/screens/homeScreenView.dart';
import 'package:ecommerce_app/features/Profile/Domain/ProfileEntity/profileEntity.dart';
import 'package:ecommerce_app/features/Profile/Ui/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/SignIn/Ui/widgets/containerContentSignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Theming/AppStyle.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {

late ProfileCubit profileCubit;

bool isEdit = false;


late  TextEditingController emailController ;
  late TextEditingController phoneController ;
  late TextEditingController nameController ;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
@override
  void initState() {

   profileCubit=ProfileCubit.get(context);
   emailController=TextEditingController();
   phoneController=TextEditingController();
   nameController=TextEditingController();


   super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),

      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {

          if(state is ProfileUpdatedSuccess){
            showSnackBar(context, state.msg);
          }


        },
        builder: (context, state) {


      if(state is ProfileLoaded){

nameController.text=state.profileResponse.name??"mo";
emailController.text=state.profileResponse.email??"";
phoneController.text=state.profileResponse.phone??"";

      return Form(
        key: formKey,
        child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: verticalSpace(20.h),
          ),
        SliverToBoxAdapter(
        child: CircleAvatar(
          radius: 100.r,
          backgroundImage: CachedNetworkImageProvider(
              state.profileResponse.image??"",maxHeight: 100.h.toInt()),
        ),
        ),
         SliverToBoxAdapter(
           child: verticalSpace(8.h),
         ) ,
         SliverToBoxAdapter(
           child: Center(
             child: MyTextFormField(validator: (p0)
              => isNameValid(p0)

             ,
                 controller: nameController,
            icon:  Icon(Icons.edit,color: AppColor.primaryColor,size: 20.sp,),

            labelText: AppText.name
             )
            ,
           ),
         ),
         SliverToBoxAdapter(
           child: verticalSpace(8.h),
         ) ,
         SliverToBoxAdapter(
           child: Center(
             child: MyTextFormField(validator: (p0) =>
                isEmailValid(p0)

             ,controller: emailController
                 , labelText: AppText.email,

               icon:   Icon(Icons.edit,color: AppColor.primaryColor,size: 20.sp,)),

           ),
         ),
          SliverToBoxAdapter(
            child: verticalSpace(8.h),
          ) ,
          SliverToBoxAdapter(
            child: Center(
              child: MyTextFormField(
                  validator:(p0) =>
                 isPhoneValid(p0)
,
              controller: phoneController,


                      icon:  Icon(Icons.edit,color: AppColor.primaryColor,size: 20.sp,)

                  , labelText: AppText.phoneNumber)
            ),
          ),
          SliverToBoxAdapter(

           child:    verticalSpace(20.h),

          ),

          SliverToBoxAdapter(
            child: Center(
              child:
             ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 5.h),
                        ),
                        onPressed: () async {

                          await updatingProfile(state);
                        }
                        , child:  Text(isEdit?AppText.save:AppText.edit
                      ,style: AppStyle.regularPoppins13,)

                    ),


            ),



          )],
        ),
      );
      }

     else if(state is ProfileError){
       return DataError(errorMsg: state.error,);
      }

     return const Center(
       child:  CircularProgressIndicator(
         color: AppColor.primaryColor,
       ),
     );

      }
      ),
    );

  }

late ProfileEntity profile;

  Future<void> updatingProfile(ProfileLoaded state) async {
       profile =ProfileEntity
      (name: nameController.text
        , email: emailController.text
        , phone: phoneController.text, image:
        state.profileResponse.image);

    if(formKey.currentState!.validate()){

     if(isEdit&&!(state.profileResponse==profile)){
       await  profileCubit.updateProfile(profile);
       await profileCubit.getProfile();
     }

     setState(() {
       isEdit=!isEdit;
     });

    }
  }

  String? isNameValid(String? p0) {
      if(p0!.isEmpty){
      return AppText.pleaseEnterYourName;
    }
    if(p0.length<3){
      return AppText.theLengthOfTheNameIsTooShort;
    }
    return null;
  }

  String? isEmailValid(String? p0) {
     if(p0!.isEmpty||!AppRegex.isEmailValid(p0)){
      return AppText.pleaseEnterValidEmail;
    }
    return null;

  }

  String? isPhoneValid(String? p0) {
           if(!AppRegex.isPhoneNumberValid(p0!)||p0.isEmpty){
      return AppText.pleaseEnterYourPhoneRight;
    }
    return null;
  }







@override
void dispose() {
  // TODO: implement dispose
  super.dispose();

 emailController.dispose();
 phoneController.dispose();
 nameController.dispose();
 profileCubit.close();
}
}
