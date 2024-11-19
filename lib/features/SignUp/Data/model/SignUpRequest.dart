import 'package:json_annotation/json_annotation.dart';
part 'SignUpRequest.g.dart';
@JsonSerializable()
class SignUpRequest{
 final String name;
 final String email;
 final String password;
 final String phone;
 final String? image;
 SignUpRequest({
   required this.name,
   required this.password,
   required this.email,
   required this.phone,
    this.image
});
 Map<String,dynamic> toJson()=>_$SignUpRequestToJson(this);
}