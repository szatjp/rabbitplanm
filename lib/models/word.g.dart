// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word()
    ..fwordno = json['fwordno'] as String
    ..fword = json['fword'] as String
    ..fpronunciation = json['fpronunciation'] as String
    ..fwordclass = json['fwordclass'] as String
    ..frelaword = json['frelaword'];
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'fwordno': instance.fwordno,
      'fword': instance.fword,
      'fpronunciation': instance.fpronunciation,
      'fwordclass': instance.fwordclass,
      'frelaword': instance.frelaword,
    };
