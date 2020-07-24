// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newwords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Newwords _$NewwordsFromJson(Map<String, dynamic> json) {
  return Newwords()
    ..fid = json['fid'] as int
    ..fnewword = json['fnewword'] as String
    ..fword = json['fword'] as String
    ..fpronunciation = json['fpronunciation'] as String
    ..fwordclass = json['fwordclass'] as String
    ..fgroup = json['fgroup'] as int
    ..fgroupnum = json['fgroupnum'] as String
    ..fnote = json['fnote'] as String;
}

Map<String, dynamic> _$NewwordsToJson(Newwords instance) => <String, dynamic>{
      'fid': instance.fid,
      'fnewword': instance.fnewword,
      'fword': instance.fword,
      'fpronunciation': instance.fpronunciation,
      'fwordclass': instance.fwordclass,
      'fgroup': instance.fgroup,
      'fgroupnum': instance.fgroupnum,
      'fnote': instance.fnote,
    };
