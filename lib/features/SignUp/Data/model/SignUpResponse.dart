import 'dart:convert';

import 'dart:convert';

class SignUpResponse {
  bool status;
  String message;
  Data? data;

  SignUpResponse({
    required this.status,
    required this.message,
     this.data,
  });

  factory SignUpResponse.fromRawJson(String str) => SignUpResponse.fromJson(json.decode(str));



  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]??<String,dynamic>{} ),
  );


}

class Data {
  final String? name;
  final String? phone;
 final String? email;
  final int? id;
 final String? image;
  final String? token;

  Data({
     this.name,
     this.phone,
     this.email,
     this.id,
     this.image,
     this.token,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "id": id,
    "image": image,
    "token": token,
  };
}
