import 'package:arctekko/domain/core/interfaces/hive.interface.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class User with BaseHive<User> {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String website;

  @override
  dynamic get hiveKey => id;

  @override
  UserAdapter get adapter => UserAdapter();

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
