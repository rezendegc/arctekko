import 'package:json_annotation/json_annotation.dart';

part 'post.model.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final String title;
  final String body;

  Post({
    this.id,
    this.body,
    this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
