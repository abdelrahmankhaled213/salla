import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/features/SignUp/Ui/widgets/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreenView extends StatelessWidget {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 15.h),
        child: SafeArea(

          child: Stack(
            
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(AppText.signUp,style: AppStyle.semiBoldPoppins30,),

              verticalSpace(2),

              Text(AppText.createAnAccountToGetStarted,
                style: AppStyle.regularPoppins13,),

              verticalSpace(40),

              const CustomContainerSignUp(),
            ],
          ),
       
          Positioned(
            right: 0,
            top: 50.h,
              child: Image.asset
                ("assets/Png/2a9fee89-1bdb-d3be-4a75-0f2ea5c49ebc_710x533-removebg-preview 1.png"
                ,height: 90.h,),
          ),
          ],

          ),
        ),
      ),

    );
  }
}

// class CustomTakePhoto extends StatefulWidget {
//   @override
//   State<CustomTakePhoto> createState() => _CustomTakePhotoState();
// }
//
// class _CustomTakePhotoState extends State<CustomTakePhoto> {
//
// var takePhoto=false;
//
//
//   @override
//   Widget build(BuildContext context) {
//    final cubit= SignUpCubit.get(context);
//     return Stack(
//    children: [
//      Center(
//        child: cubit.xFile==null ?
//        CircleAvatar(
//          radius:70.r,
//          backgroundColor:takePhoto? AppColor.primaryColor:Colors.
//          transparent.withOpacity(0.1) ,
//          child:
//                Icon(Icons.camera_alt,size: 55.sp,color: Colors.white,)):
//     ClipRRect(borderRadius: BorderRadius.circular(60.r)
//         ,child: Image.file(File(cubit.xFile!.path)
//           ,height: 100.h,width: 130.w,fit: BoxFit.cover,))
//      ),
//
//
//
//     Positioned(
//       right: -50.w,top: -20.h,
//       left: 0,
//       bottom: 35.h,
//
//       child: IconButton(
//             onPressed:
//       () async{
//             setState(() {
//       takePhoto=true;
//             });
//
//            await showDialog(context: context, builder: (context) {
//
//              return  CustomDialog(
//                signUpCubit: cubit,
//              );
//            });

//            setState(() {
//              takePhoto=false;
//            });
//
//           }
//           ,icon:  Icon(Icons.add,size: 15.sp,color: takePhoto?Colors.white:AppColor.primaryColor,)),
//     ),
//
//     ]
//     );
//   }
// }
// class CustomDialog extends StatelessWidget {
//   final SignUpCubit signUpCubit;
//   const CustomDialog({required this.signUpCubit});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return  BlocProvider.value(
//  value: signUpCubit,
//   child: AlertDialog(
//
//       contentPadding: EdgeInsets.all(15.sp),
//       alignment: Alignment.center,
//       content: CustomChooseGalleryOrPhotoContent(
//         signUpCubit: signUpCubit,
//       )
//
//     ),
// );
//   }
// }
// class CustomChooseGalleryOrPhotoContent extends StatelessWidget {
//   final SignUpCubit signUpCubit;
//   CustomChooseGalleryOrPhotoContent({
//     required this.signUpCubit
// });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(AppText.chooseImage,style: AppStyle.regularPoppins13.copyWith(
//           color: Colors.black,
//           fontSize: 20.sp
//         ),),
//         verticalSpace(10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
// GestureDetector(onTap: () async {
//
//   signUpCubit.xFile=await  signUpCubit.imagePicker.pickImage(
//       source: ImageSource.camera);
//
// if(signUpCubit.xFile!=null){
//   signUpCubit.file=File(signUpCubit.xFile!.path);
//   signUpCubit.base64encode = base64Encode( signUpCubit.file!.readAsBytesSync());
//   print("base64 : "+signUpCubit.base64encode);
// }
// else{
//
// }
//
// },child: Icon(Icons.camera_alt,size: 50.sp,)),
//             Icon(Icons.photo,size: 50.sp,)
//
//           ],
//         )
//       ],
//
//     );
//   }
// }
