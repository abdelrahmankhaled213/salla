import 'package:dartz/dartz.dart';

abstract class NoParamsUseCase<T>{
  Future<Either<String, T>> call(void params);
}