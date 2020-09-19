import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  User({
    this.email,
    this.id,
    this.name,
    this.phone,
    this.username,
    this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
