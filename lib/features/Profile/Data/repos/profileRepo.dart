import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Networking/api_constants.dart';
import 'package:ecommerce_app/core/Networking/api_consumer.dart';
import 'package:ecommerce_app/features/Profile/Data/Mapper/mapSignInModelToProfileEntity.dart';
import 'package:ecommerce_app/features/Profile/Data/localDataSource/localDataSource.dart';
import 'package:ecommerce_app/features/Profile/Domain/ProfileEntity/profileEntity.dart';
import 'package:ecommerce_app/features/SignIn/Data/model/SignInResponse.dart';

class ProfileRepo {
  late ApiConsumer apiConsumer;
  late ProfileLocalDataSource profileLocalDataSource;

  ProfileRepo(
      {required this.apiConsumer, required this.profileLocalDataSource});

  Future<Either<String, ProfileEntity>> getProfile() async {
    try {
      final profile = profileLocalDataSource.getCachedProfile();
      if (profile != null) {
        return Right(profile);
      }

      final response = await apiConsumer.get(ApiConstants.profileEndpoint);

      final apiProfile = MapperSignInModelToProfileEntity.fromSignInResponse(
          SignInResponse.fromJson(response));

if(response['status'] == true){

       await profileLocalDataSource.cacheProfile(
            MapperSignInModelToProfileEntity.fromSignInResponse(
                SignInResponse.fromJson(response)));

}


      return Right(apiProfile);
    }

    on ServerException catch (e) {
       final profile = profileLocalDataSource.getCachedProfile();
       if (profile != null) {
         return Right(profile);
       }
      return Left(e.errorMsg);
    }
  }

  Future<Either<String, ProfileEntity>> updateProfile(
      ProfileEntity profileEntity) async {
    try {
      final response = await apiConsumer.put

        (ApiConstants.profileUpdateEndpoint, data: profileEntity.toJson());

      final apiProfile = MapperSignInModelToProfileEntity.fromSignInResponse(
          SignInResponse.fromJson(response));

      if(response['status'] == true){
        await profileLocalDataSource.updateProfile(profileEntity);
}


      return Right(apiProfile);
    }
    on ServerException catch (e) {
      return Left(e.errorMsg);
    }
  }
}
