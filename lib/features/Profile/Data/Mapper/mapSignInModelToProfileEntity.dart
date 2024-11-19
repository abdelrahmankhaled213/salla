import 'package:ecommerce_app/features/Profile/Domain/ProfileEntity/profileEntity.dart';
import 'package:ecommerce_app/features/SignIn/Data/model/SignInResponse.dart';

abstract class MapperSignInModelToProfileEntity{
   static ProfileEntity fromSignInResponse(SignInResponse signInResponse){
    return ProfileEntity(
      name: signInResponse.data?.name,
      phone: signInResponse.data?.phone,
      email: signInResponse.data?.email,
      image: signInResponse.data?.image,
      msg: signInResponse.message

    );
  }
}