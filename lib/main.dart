import 'dart:developer';
import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/ecommerceApp.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/favouriteData.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataCached.dart';
import 'package:ecommerce_app/features/Profile/Domain/ProfileEntity/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer=MyBlocObserver();
  setUpServiceLocator();
  await Hive.initFlutter();

  Hive.registerAdapter(ProfileEntityAdapter());
Hive.registerAdapter(FavouriteDataAdapter());

await Hive.openBox<ProfileEntity>(AppText.profileEntityCache);
await Hive.openBox<FavouriteData>(AppText.favBox);

  await getIt<CacheHelper>().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( const EcommerceApp());
}


class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}');
  }
}
