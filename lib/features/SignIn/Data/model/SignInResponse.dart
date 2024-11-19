import 'package:json_annotation/json_annotation.dart';
part 'SignInResponse.g.dart';

@JsonSerializable()
class SignInResponse{
  final bool status;
  final String? message;
  final Data? data;

  SignInResponse({
    this.data,
    required this.message,
    required this.status
});
 factory SignInResponse.fromJson(Map<String,dynamic>json)=>_$SignInResponseFromJson(json);

}
@JsonSerializable()
class Data{
  final int id;
  final String name;
  final String phone ;
  final String email;
  final String image;
  final String token;
  Data({
   required this.name,
  required this.id,
    required this.token,
    required this.image,
    required this.email,
    required this.phone

  });
  factory Data.fromJson(Map<String,dynamic>json)=>_$DataFromJson(json);
}