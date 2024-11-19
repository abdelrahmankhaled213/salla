import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:ecommerce_app/features/HomeDetails/logic/home_details_cubit.dart';
import 'package:ecommerce_app/features/Search/Data/repos/searchRepo.dart';
import 'package:ecommerce_app/features/Search/Ui/screens/searchScreenView.dart';
import 'package:ecommerce_app/features/Search/logic/Debouncer.dart';
import 'package:ecommerce_app/features/Search/logic/search_cubit.dart';
import 'package:ecommerce_app/features/SignIn/Ui/screens/loginScreenView.dart';
import 'package:ecommerce_app/features/SignIn/logic/sign_in_cubit.dart';
import 'package:ecommerce_app/features/SignUp/Data/repos/signUpRepo.dart';
import 'package:ecommerce_app/features/SignUp/Ui/Screens/signUpScreenView.dart';
import 'package:ecommerce_app/features/SignUp/logic/sign_up_cubit.dart';
import 'package:ecommerce_app/features/splash/splashScreenView.dart';
import 'package:ecommerce_app/homeLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/HomeDetails/Ui/screens/homeDetailsScreen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouter.signUp:
      return MaterialPageRoute(builder: (context) {
        return BlocProvider(create: (context) =>
            SignUpCubit(signUpRepo: getIt<SignUpRepo>())
            , child: const SignUpScreenView());
      },);


    case AppRouter.login:
      return MaterialPageRoute(
        builder: (context) {
          return BlocProvider(create: (context) {
            return SignInCubit(getIt());
          }, child: const SignInScreenView());
        },
      );

    case AppRouter.homeLayout:
      return MaterialPageRoute(
        builder: (context) {
          return const HomeLayoutScreenView();
        },
      );

    case AppRouter.detailsHomeScreen:
      return MaterialPageRoute(
          builder: (context) {
            final args = settings.arguments as Product;
            return BlocProvider(
              create: (context) => HomeDetailsCubit(),
              child: HomeDetailsScreen(
                product: args,

              ),
            );
          }
      );

      case AppRouter.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreenView();
          },
        );
    case AppRouter.searchScreen:
      return MaterialPageRoute(
        builder: (context) {
          return BlocProvider(create: (context) {

            return SearchCubit(getIt<SearchRepo>(),getIt<DeBouncer>());

          },child: const SearchScreenView());
        },
      );

    default :
      return null;
  }
}
