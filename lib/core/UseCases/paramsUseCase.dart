import 'package:dartz/dartz.dart';

abstract class ParamsUseCase<T, P>{
  Future<Either<String, T>> call(P params);
}