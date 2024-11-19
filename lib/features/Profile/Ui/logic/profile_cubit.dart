import 'package:ecommerce_app/features/Profile/Data/repos/profileRepo.dart';
import 'package:ecommerce_app/features/Profile/Domain/ProfileEntity/profileEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  bool isEdit = false;
  final ProfileRepo profileRepo;


  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);



 getProfile()async {

  emit(ProfileLoading());

  if(isClosed){
    return;
  }
  final result = await profileRepo.getProfile();
  result.fold((l) {
    emit(ProfileError(l));
  }, (r) {

    emit(ProfileLoaded(r));
  });
  }

  updateProfile(ProfileEntity profileEntity)async {

 final result = await profileRepo.updateProfile(profileEntity);


if(isClosed){
  return;
}
  result.fold((l) {
    emit(ProfileUpdatedError(l));
  }, (r) {
    emit(ProfileUpdatedSuccess(r.msg!));
  });
  }

}
