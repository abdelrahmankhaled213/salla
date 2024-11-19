import 'dart:developer';
import 'dart:ui';
import'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Helpers/onRouting.dart';
import 'package:ecommerce_app/core/Helpers/sizedBox.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/core/widgets/shimmerWidget.dart';
import 'package:ecommerce_app/features/Favourites/Data/repo/favouriteRepo.dart';
import 'package:ecommerce_app/features/Favourites/logic/favourite_cubit.dart';
import 'package:ecommerce_app/features/Home/Data/model/categoryData.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:ecommerce_app/features/Home/Ui/widgets/containerCarousel.dart';
import 'package:ecommerce_app/features/Home/Ui/widgets/isFavProduct.dart';
import 'package:ecommerce_app/features/Home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => HomeScreenViewState();
}

class HomeScreenViewState extends State<HomeScreenView> {

  String? name;


  @override
  void initState() {

    super.initState();

    getCachedData();

  }

  getCachedData() {

    name = getIt<CacheHelper>().getData(key: AppText.nameSignInModel);

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) =>
      FavouriteCubit(favouriteRepo: getIt<FavouriteRepo>()
          ,homeCubit: getIt<HomeCubit>())..getFavourites(),

  child: BlocBuilder<HomeCubit, HomeState>(

  builder: (context, state) {



    if(state is HomeError){

    return Padding(padding: EdgeInsets.symmetric(horizontal: 12.w)
        ,child: DataError(errorMsg: state.error,));

    }

    else if(state is HomeLoaded){

      final homeCubit = HomeCubit.get(context);

      return Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 15.h),
        child: CustomScrollView(
          slivers: [

        SliverToBoxAdapter(
        child: Text("Hello $name",
          style: AppStyle.semiBoldPoppins18,),
      ),

      SliverToBoxAdapter(
        child: verticalSpace(4),
      ),
      SliverToBoxAdapter(
        child: Text(AppText.letsGetSomething,
          style: AppStyle.regularPoppins13.copyWith(
              color: AppColor.darkGrey
          ),),
      ),
      SliverToBoxAdapter(
        child: verticalSpace(10),
      ),

      SliverToBoxAdapter(
          child: CarouselSlider.builder(
      itemCount: homeCubit
          .homeData
          ?.data
          .banners
          .length ?? 3,

        itemBuilder: (context, index, realIndex) {
          return ContainerCarousel(
              banner:homeCubit
                  .homeData!
                  .data
                  .banners[index]);
        }, options: CarouselOptions(
      scrollDirection: Axis.horizontal,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 1,
      animateToClosest: true,

            )
            )

      ),



      SliverToBoxAdapter(
        child: verticalSpace(10),
      ),

        SliverToBoxAdapter(
          child: Text(AppText.categories,
            style: AppStyle.semiBoldPoppins18,),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 150.h,

            child: ListView.separated(
shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => horizontalSpace(12),
              itemBuilder: (context, index) {
                return  CategoryContainer(category: state.categoryData[index],);
              }, itemCount: state.categoryData.length,
            ),
          )
      ),

      SliverToBoxAdapter(
        child: verticalSpace(20),
      ),

      SliverToBoxAdapter(
        child: Text(AppText.products,
          style: AppStyle.semiBoldPoppins18,),
      ),

      SliverToBoxAdapter(
      child:
      GridView.builder(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics() ,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h
          , crossAxisSpacing: 10, childAspectRatio: 0.6),

      itemCount: homeCubit.homeData?.data.products.length,

      itemBuilder: (context, index) {

        final product = homeCubit.homeData!.data.products[index];

        return  ProductContainer(product: product,);
      },

          )
      ),


            ])
          );

    }

    return const ShimmerWidget(height: double.infinity, width: double.infinity);

                    }


  )
    );

  }
}

class CategoryContainer  extends StatelessWidget {
 final CategoryData category;

  const CategoryContainer({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        // Blurred Image
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: CachedNetworkImage(
            imageUrl: category.image,
        // Ensure full width of the image
            height: 100.h,
            width: 250.w,// Set desired height
            fit: BoxFit.cover, // Cover the full width of the Container
          ),
        ),
        // Text Overlay
        Positioned(
          right: 0,
          left: 0,

            child: Text(
              category.name,
              style: AppStyle.semiBoldPoppins18,
              textAlign: TextAlign.center,
            ),
          ),

      ],
    );

  }
}

class DataError extends StatelessWidget {
  final String errorMsg;
  const DataError({
    super.key,
    required this.errorMsg
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/Png/internet-6896_512.gif")

            ,verticalSpace(10)

            ,Text(errorMsg,style: AppStyle.semiBoldPoppins18,textAlign: TextAlign.center,)
          ],
        ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(AppRouter.detailsHomeScreen,args:  product);
      },
      child: Container(
        height: 200.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColor.primaryColor.withOpacity(0.1),),

        ),
        child: Stack(

          children: [
          Column(
        children: [
          CachedNetworkImage(
              height: 150.h,width: 100.w ,imageUrl: product
              .image??"",
            errorListener: (value) {
              log("my error : $value");
            },
          ),

          verticalSpace(5),

         product.discount!=0?

          Align(alignment: Alignment.centerLeft,child: discountText())
             :const SizedBox(),

          verticalSpace(5),

          Text(product.name,maxLines: 2,
            style: AppStyle.semiBoldPoppins15.copyWith(
            overflow: TextOverflow.ellipsis,
            height: 1.5,

            color: AppColor.grey,

          ),
          ),


        ],
      ),

      IsFavProduct(product: product)
          ],

        ),
      ),
    );
  }
}




Widget discountText(){

  return Container(height: 20.h,width: 60.w,decoration: const BoxDecoration(

    color: AppColor.grey2,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomRight: Radius.circular(5)),

),
child:
Text("Discount", style: AppStyle.regularPoppins13,));
}




