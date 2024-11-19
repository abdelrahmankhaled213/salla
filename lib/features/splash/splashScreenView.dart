import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Helpers/onRouting.dart';
import 'package:ecommerce_app/core/Routing/appRouter.dart';
import 'package:ecommerce_app/core/Theming/AppStyle.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/Theming/colors.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with TickerProviderStateMixin {
  
  AnimationController? animationController;
  Animation<Offset>? animation;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  animationController=AnimationController(vsync: this, 
      duration: const Duration(seconds: 2));
  animation=Tween<Offset>(begin: const Offset(0, -8),
      end: const Offset(0, 0)).animate(animationController!);
  animationController!.forward();
  navigate(
    context
  );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController!.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primaryColor,
      body:  splashScreenBody(animation!),
    );
  }
}

void navigate(BuildContext context) {
  Future.delayed(
      const Duration(seconds: 3), () {
    if( getIt<CacheHelper>() .getData(key: AppText.token) == null) {

      context.pushReplacementNamed(AppRouter.signUp);

    } else {

      context.pushReplacementNamed(AppRouter.homeLayout);

    }
  });
}
Widget splashScreenBody(Animation<Offset>animation) {
  return  Center(
child:  AnimatedBuilder(
  animation:animation ,
  builder: (context, child) {
  return SlideTransition(position: animation
      ,child: Text(AppText.appName,style: AppStyle.regularPacifico40));
},
)
  );
}

  