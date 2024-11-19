import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/SignUp/Data/model/SignUpRequest.dart';
import 'package:ecommerce_app/features/SignUp/Data/model/SignUpResponse.dart';
import 'package:ecommerce_app/features/SignUp/Data/repos/signUpRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;

 final GlobalKey<FormState>globalKey=GlobalKey<FormState>()
  ;





  SignUpCubit({required this.signUpRepo}) : super(SignUpInitial());

  // providing instance of cubit

static SignUpCubit get(context) =>BlocProvider.of(context);

 Future<void> signUp(SignUpRequest signUpRequest)async{
    emit(SignUpLoading());
final Either<String,SignUpResponse> response =
await signUpRepo.signUp(signUpRequest);
response.fold((l) {
  emit(SignUpError(errorMsg: l));
}, (r) {

emit(SignUpLoaded(signUpResponse: r));

},
);

  }


}
