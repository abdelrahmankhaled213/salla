import 'package:hive/hive.dart';
part 'profileEntity.g.dart';

@HiveType(typeId: 3)

class ProfileEntity extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? image;

  String? msg;


  ProfileEntity({this.msg,required this.name,required this.phone,required this.email,required this.image});

  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'phone':phone,
      'email':email,

    };
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return other is ProfileEntity && other.name == name && other.phone == phone && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ phone.hashCode ^ email.hashCode;
}