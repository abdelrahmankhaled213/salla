import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/features/Profile/Domain/ProfileEntity/profileEntity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ProfileLocalDataSource{
  ProfileEntity? getCachedProfile();
  Future<void> cacheProfile(ProfileEntity profileEntity);
  Future<void> updateProfile(ProfileEntity profileEntity);
  Future<void> deleteProfile();
}

class HiveLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<void> cacheProfile(ProfileEntity profileEntity) async {

await Hive.box<ProfileEntity>(AppText.profileEntityCache).add(profileEntity);

  }

  @override
  ProfileEntity? getCachedProfile() {
    final Box<ProfileEntity>? box=  Hive.box<ProfileEntity>(AppText.profileEntityCache);
    print("box ${box?.values}");

    if (box != null||box!.isNotEmpty) {
return box.get(0);
    }
    return null;
  }

  @override
  Future<void> updateProfile(ProfileEntity profileEntity) async{
   await Hive.box<ProfileEntity>(AppText.profileEntityCache).putAt(0, profileEntity);
  }

  @override
  Future<void> deleteProfile() async{
    return await Hive.box<ProfileEntity>(AppText.profileEntityCache).deleteAt(0);
  }





}