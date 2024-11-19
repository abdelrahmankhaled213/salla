import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Helpers/onRouting.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/features/Cart/Data/repos/cartRepo.dart';
import 'package:ecommerce_app/features/Cart/Ui/screens/CartScreenView.dart';
import 'package:ecommerce_app/features/Cart/logic/cart_cubit.dart';
import 'package:ecommerce_app/features/Favourites/Data/repo/favouriteRepo.dart';
import 'package:ecommerce_app/features/Favourites/Ui/screens/FavouritesScreenView.dart';
import 'package:ecommerce_app/features/Favourites/logic/favourite_cubit.dart';
import 'package:ecommerce_app/features/Home/Ui/screens/homeScreenView.dart';
import 'package:ecommerce_app/features/Home/logic/home_cubit.dart';
import 'package:ecommerce_app/features/Profile/Data/repos/profileRepo.dart';
import 'package:ecommerce_app/features/Profile/Domain/ProfileEntity/profileEntity.dart';
import 'package:ecommerce_app/features/Profile/Ui/logic/profile_cubit.dart';
import 'package:ecommerce_app/features/Profile/Ui/screens/profile_ScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';


class HomeLayoutScreenView extends StatefulWidget {
  const HomeLayoutScreenView({super.key});

  @override
  State<HomeLayoutScreenView> createState() => _HomeLayoutScreenViewState();
}

class _HomeLayoutScreenViewState extends State<HomeLayoutScreenView> {

List<Widget> screens = [

  const HomeScreenView()
  ,
  BlocProvider(
      create: (context) =>

      FavouriteCubit(
      homeCubit:getIt<HomeCubit>(),
        favouriteRepo: getIt<FavouriteRepo>()
      )..getFavourites()
      ,child: const FavouritesScreenView()),

BlocProvider(create: (context) {
  return CartCubit(getIt<CartRepo>(), homeCubit: getIt<HomeCubit>())..getCart();
},child: const CartScreenView()),
BlocProvider(create: (context) => ProfileCubit
  (getIt<ProfileRepo>())..getProfile(),child: const ProfileScreenView())
  ];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          unselectedItemColor: AppColor.grey2,



          onTap: (value) {
            currentIndex = value;
            setState(() {

            });
          },
          elevation: 15.sp,
          selectedItemColor: AppColor.primaryColor,

          currentIndex: currentIndex,
          items: const [

            BottomNavigationBarItem(icon: Icon(Icons.home,),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite, ),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person,),label: ''),

      ]
      ),
      appBar: AppBar(
        title: Text(AppText.appName,style: AppStyle.semiBoldPoppins15.copyWith(
          letterSpacing: 2.sp
        )),

        backgroundColor: AppColor.primaryColor,

        centerTitle: true,
        actions: [
           IconButton( onPressed: (){
             context.push(AppRouter.searchScreen);
           }, icon:  Icon(
             Icons.search,size: 20.sp,color: Colors.white,
           )
           ),
        ],
        leading: IconButton(onPressed: ()async{
          await getIt<CacheHelper>().removeData(key: AppText.token);
          Box<ProfileEntity>? boxItem = Hive.box(AppText.profileEntityCache);
          if(boxItem.isNotEmpty){
            await boxItem.clear();
            print("items box"+boxItem.values.toString());
          }
         context.pushReplacementNamed(AppRouter.login);
        }, icon: Icon(Icons.logout,
          color: Colors.white
          ,size: 20.sp,)),
      ),
      body: screens[currentIndex],

    );
  }
}
