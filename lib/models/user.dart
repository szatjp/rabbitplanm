import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
      User();

  String username;
  String email;
  @JsonKey(name: 'first_name') String firstName;
  @JsonKey(name: 'last_name') String lastName;
  @JsonKey(name: 'last_login') String lastLogin;
  @JsonKey(name: 'is_active') bool isActive;
  dynamic nickname;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
