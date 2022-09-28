import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class Post {
  const Post({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.post,
    required this.date,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

  final int id;
  final String title;
  final String subTitle;
  final String post;
  final String date;
}



