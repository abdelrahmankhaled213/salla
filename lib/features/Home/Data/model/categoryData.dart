import 'package:freezed_annotation/freezed_annotation.dart';
part 'categoryData.g.dart';

@JsonSerializable()
class CategoryData {
  final int id;
  final String name;
  final String image;

  CategoryData({required this.id, required this.name, required this.image});

factory CategoryData.fromJson(Map<String, dynamic> json) => _$CategoryDataFromJson(json);

}