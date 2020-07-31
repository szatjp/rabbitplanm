// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Newword _$NewwordFromJson(Map<String, dynamic> json) {
  return Newword()
    ..fnewword = json['fnewword'] == null
        ? null
        : Word.fromJson(json['fnewword'] as Map<String, dynamic>)
    ..fid = json['fid'] as int
    ..fnote = json['fnote'] as String;
}

Map<String, dynamic> _$NewwordToJson(Newword instance) => <String, dynamic>{
      'fnewword': instance.fnewword,
      'fid': instance.fid,
      'fnote': instance.fnote,
    };
