import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/features/SignIn/Data/model/SignInRequest.dart';
import 'package:ecommerce_app/features/SignIn/Data/model/SignInResponse.dart';
import 'package:ecommerce_app/features/SignIn/Data/repos/signInRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInRepo signInRepo;
  SignInCubit(this.signInRepo) : super(SignInInitial());

  static SignInCubit get(BuildContext context) =>BlocProvider.of(context);

final GlobalKey<FormState>globalKey=GlobalKey<FormState>();


  late SignInResponse signInResponse;

  login(SignInRequest signRequest)async{
    emit(SignInLoading());
 final data= await signInRepo.login("login", signInRequest: SignInRequest(email:signRequest.email
     , password: signRequest.password)) ;
  data.fold((l) {
    emit(SignInFailure(errorMsg: l));
  },(r) async {
    signInResponse=r;

    if(r.data!=null){
      await getIt<CacheHelper>().saveData(key: AppText.token, value: r.data!.token);
    }
    emit(SignInLoaded(signInResponse));
  },);
  }

}
