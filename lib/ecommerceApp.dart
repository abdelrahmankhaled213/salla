import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/core/Routing/onGenerateRoute.dart';
import 'package:ecommerce_app/features/Home/Data/repos/homeRepo.dart';
import 'package:ecommerce_app/features/Home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommerceApp extends StatelessWidget {

  const EcommerceApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(330, 690),
        splitScreenMode: true,
        builder: (context, child) {

          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: BlocProvider(

              create: (context) =>getIt<HomeCubit>()..getHomeData(),

              child: const MaterialApp(

                title: 'Salla',

                debugShowCheckedModeBanner: false,

                initialRoute:
               AppRouter.splashScreen,

                onGenerateRoute: generateRoute,
              ),
            ),
          );
        }
    );
  }
}
