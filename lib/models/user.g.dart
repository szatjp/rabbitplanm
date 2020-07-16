// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..username = json['username'] as String
    ..email = json['email'] as String
    ..firstName = json['first_name'] as String
    ..lastName = json['last_name'] as String
    ..lastLogin = json['last_login'] as String
    ..isActive = json['is_active'] as bool
    ..nickname = json['nickname'];
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'last_login': instance.lastLogin,
      'is_active': instance.isActive,
      'nickname': instance.nickname,
    };
