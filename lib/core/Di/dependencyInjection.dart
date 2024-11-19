import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Networking/dio_consumer.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/features/Cart/Data/repos/cartRepo.dart';
import 'package:ecommerce_app/features/Favourites/Data/repo/favouriteRepo.dart';
import 'package:ecommerce_app/features/Home/Data/repos/homeRepo.dart';
import 'package:ecommerce_app/features/Home/logic/home_cubit.dart';
import 'package:ecommerce_app/features/Profile/Data/localDataSource/localDataSource.dart';
import 'package:ecommerce_app/features/Profile/Data/repos/profileRepo.dart';
import 'package:ecommerce_app/features/Search/Data/repos/searchRepo.dart';
import 'package:ecommerce_app/features/Search/logic/Debouncer.dart';
import 'package:ecommerce_app/features/SignIn/Data/repos/signInRepo.dart';
import 'package:ecommerce_app/features/SignUp/Data/repos/signUpRepo.dart';
import 'package:get_it/get_it.dart';

 GetIt getIt=GetIt.instance;

void setUpServiceLocator() {
  // Dio

  getIt.registerLazySingleton(() {
    return Dio();
  },);

  //DioConsumer

  getIt.registerLazySingleton(() {
    return DioConsumer(dio: getIt());
  },);

//LocalDataSource

  getIt.registerLazySingleton<ProfileLocalDataSource>(() {
    return HiveLocalDataSourceImpl();
  }
    ,
  );


// Repo

  getIt.registerLazySingleton(() {
    return SignUpRepo(apiConsumer: getIt<DioConsumer>());
  },);

  getIt.registerLazySingleton(() {
    return SignInRepo(getIt<DioConsumer>());
  },);

  getIt.registerLazySingleton(() {
    return HomeRepo(
         apiConsumer: getIt<DioConsumer>());
  },);

  getIt.registerLazySingleton(() {
    return FavouriteRepo(apiConsumer: getIt<DioConsumer>()
       );
  });
  getIt.registerLazySingleton(() {
    return ProfileRepo(profileLocalDataSource: getIt<ProfileLocalDataSource>(),
        apiConsumer: getIt<DioConsumer>());
  });

  getIt.registerLazySingleton(() {
    return SearchRepo(apiConsumer: getIt<DioConsumer>());
  });
  getIt.registerLazySingleton(() {
    return CartRepo(getIt<DioConsumer>());
  });

  //cacheHelper

  getIt.registerLazySingleton(() {
    return CacheHelper();
  },);



// deBouncer

  getIt.registerLazySingleton(() {
    return DeBouncer(milliseconds: 500);
  });


  // homeCubit
  getIt.registerLazySingleton(() {
    return HomeCubit(getIt<HomeRepo>());
  },);

}

