import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/features/Cart/Domain/entity/cartEntity.dart';
import 'package:ecommerce_app/features/Cart/logic/cart_cubit.dart';
import 'package:ecommerce_app/features/Favourites/Ui/screens/FavouritesScreenView.dart';
import 'package:ecommerce_app/features/Home/Ui/screens/homeScreenView.dart';
import 'package:ecommerce_app/features/SignIn/Ui/widgets/containerContentSignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreenView extends StatelessWidget {
  const CartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  CartBody(),
    );
  }
}
class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(builder: (context, state) {

      if(state is GetCartLoading){

        return  loadingWidget();
      }

      if(state is GetCartSuccess){
        return
          state.cart.isEmpty? const EmptyCart():
          Padding(
          padding:  EdgeInsets.only(right: 12.w,left: 12.w,top: 12.h),
          child: ListView.builder(itemBuilder: (context, index) {
            return CartCard( cart: state.cart[index],);
          },itemCount: state.cart.length,),
        );
      }

      else if(state is GetCartError)
        {
          return DataError(errorMsg: state.error);
        }
      else if(state is AddOrDeleteCartSuccess){

        return  loadingWidget();
      }
      return const SizedBox.shrink();

    }, listener: (context, state) {

      if(state is AddOrDeleteCartSuccess){
          showSnackBar(context, state.cartResponse.message);
      }
      else if(state is AddOrDeleteCartError){
        showSnackBar(context, state.error);
      }
    },);
  }
}

class EmptyCart extends StatelessWidget {

  const EmptyCart();

  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: double.infinity,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Center(
           child: Image.asset("assets/Png/e-commerce-optimization (1).png",
           
           height: 150.h,
           width: 150.w,
           
           
           
           ),
         ),
     verticalSpace(12),
         Text(AppText.cartIsEmpty ,
           style: AppStyle.semiBoldPoppins18.copyWith(color: AppColor.primaryColor),),
     ]),
   );
  }
}

class CartCard extends StatelessWidget {

  final CartEntity cart;

  const CartCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {

    final cartCubit=CartCubit.get(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: Slidable(

        startActionPane: ActionPane(


      motion: const ScrollMotion(),
            children: [
            SlidableAction(
            onPressed: (context) async {

  await cartCubit.addOrRemoveCart(cart.id);

  },

              backgroundColor: AppColor.primaryColor,

              borderRadius: const BorderRadius.all(Radius.circular(15)),
              icon: Icons.delete,



    )
    ]
        ),

        child: Card(
          elevation: 10,

          shape: Border.all(
        color: AppColor.primaryColor.withOpacity(0.3),
        ),
          child: CardContent(cart: cart),
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
    required this.cart,
  });

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

            Expanded(
    child: CachedNetworkImage(imageUrl: cart.image,height: 150.h,
      placeholder: (context, url)
      => const Center(child: CircularProgressIndicator(),)
      ,errorWidget: (context, url, error) => const Icon(Icons.error),),
            ),


        horizontalSpace(5),


        Expanded(
          child: Column(
            children: [
              Text(cart.name,
                style: AppStyle.semiBoldPoppins18.copyWith(color: AppColor.grey)
                ,maxLines: 3,overflow: TextOverflow.ellipsis,),
          verticalSpace(10),
          Text("${cart.price}\t"+"L.E",style: AppStyle.semiBoldPoppins18.copyWith(color: AppColor.grey),),
            ],
          ),
        ),



      ],
    );
  }
}


