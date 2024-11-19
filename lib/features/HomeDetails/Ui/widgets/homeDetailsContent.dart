import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/core/widgets/CustomButton.dart';
import 'package:ecommerce_app/features/Cart/Data/repos/cartRepo.dart';
import 'package:ecommerce_app/features/Cart/logic/cart_cubit.dart';
import 'package:ecommerce_app/features/Favourites/Ui/screens/FavouritesScreenView.dart';
import 'package:ecommerce_app/features/Home/logic/home_cubit.dart';
import 'package:ecommerce_app/features/HomeDetails/Ui/widgets/selectImageContent.dart';
import 'package:ecommerce_app/features/HomeDetails/logic/home_details_cubit.dart';
import 'package:ecommerce_app/features/SignIn/Ui/widgets/containerContentSignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 class HomeDetailsContent extends StatelessWidget {

  const HomeDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)
      => CartCubit(getIt<CartRepo>(), homeCubit: HomeCubit.get(context)),

      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [

            Text(HomeDetailsCubit.get(context).productChosen.name
              ,style: AppStyle.semiBoldPoppins18.copyWith(
                  color: AppColor.grey
              )
              ,maxLines: 2,overflow: TextOverflow.ellipsis,),

            verticalSpace(8),

            SizedBox(
              height: 80.h,
              child: ListView.separated(separatorBuilder: (context, index) =>
                  SizedBox(width: 15.w,)
                ,scrollDirection: Axis.horizontal
                ,itemBuilder: (context, index) {
                  return SelectImageContent(
                      productImages: HomeDetailsCubit.get(context).productChosen.images![index]);
                },itemCount: HomeDetailsCubit.get(context).productChosen.images!.length,
              ),
            ),

            verticalSpace(8),

      const Description(),

            verticalSpace(8),

            BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {

                if(state is AddOrDeleteCartSuccess){

                  showSnackBar(context, state.cartResponse.message, color: AppColor.primaryColor);
                }

                if(state is AddOrDeleteCartError){
                  showSnackBar(context, state.error, color: Colors.red);
                }
              },
  builder: (context, state) {

    final cart = CartCubit.get(context);
    final homeCubit = HomeCubit.get(context);
    final homeDetailsCubit=HomeDetailsCubit.get(context);

    if(state is AddOrDeleteCartSuccess){

    return Row(

      children: [
        Expanded(
          flex: 2,
          child: CustomButton(onPressed: () {

            cart.addOrRemoveCart(homeDetailsCubit.productChosen.id);

          }, text: homeCubit.isCart[homeDetailsCubit.productChosen.id]! ?
          AppText.removeFromCart:
          AppText.addToCart),
        ),

        horizontalSpace(10),

        AddOrRemoveQuantity(homeDetailsCubit: homeDetailsCubit,)

      ],
    );
    }

    return Row(

      children: [
        Expanded(
          flex: 2,
          child: CustomButton(onPressed: () {
          
            cart.addOrRemoveCart(homeDetailsCubit.productChosen.id);
          
          }, text: homeCubit.isCart[homeDetailsCubit.productChosen.id]! ?
          AppText.removeFromCart:
          AppText.addToCart),
        ),

        horizontalSpace(10),

         AddOrRemoveQuantity(homeDetailsCubit: homeDetailsCubit,)

      ],
    );

  },
),


          ],
        ),
      ),
    );
  }
}


class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
   bool isMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          HomeDetailsCubit.get(context).productChosen.description,
          style: AppStyle.semiBoldPoppins15.copyWith(
              color: AppColor.grey
          ),
          overflow:
          isMore ? TextOverflow.visible : TextOverflow.ellipsis,

          maxLines: isMore ? 20 : 3
          ,),

        TextButton(onPressed: (){
          isMore = !isMore;
          setState(() {});

        }, child: Text( isMore ? "Show less" :"Show more"
            ,style: AppStyle.regularPoppins13.copyWith(
            color: AppColor.primaryColor
            )
        ),

        )
      ],
    );
  }
}


class AddOrRemoveQuantity extends StatefulWidget {

   final HomeDetailsCubit homeDetailsCubit;

  const AddOrRemoveQuantity({super.key,required this.homeDetailsCubit});

  @override
  State<AddOrRemoveQuantity> createState() => _AddOrRemoveQuantityState();
}

class _AddOrRemoveQuantityState extends State<AddOrRemoveQuantity> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColor.grey,
            child: IconButton(onPressed:widget.homeDetailsCubit.productChosen.inCart
                ?null:(){}, icon:
             Icon( Icons.add, size: 20.sp,color: Colors.white,)),
          ),

          horizontalSpace(5),

          Text("1",style: AppStyle.semiBoldPoppins18.copyWith(
              color: AppColor.grey
          ),),

          horizontalSpace(5),

          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColor.grey,
            child: IconButton(onPressed: widget.homeDetailsCubit.
            productChosen.inCart ? null:(){}, icon: Icon(Icons.remove
              , size: 20.sp,color: Colors.white,)),
          )

        ],
      ),
    );
  }
}