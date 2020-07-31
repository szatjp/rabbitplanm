// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupnwords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Groupnwords _$GroupnwordsFromJson(Map<String, dynamic> json) {
  return Groupnwords()
    ..wgroup = json['wgroup'] == null
        ? null
        : Wordgroup.fromJson(json['wgroup'] as Map<String, dynamic>)
    ..groupwords = (json['groupwords'] as List)
        ?.map((e) =>
            e == null ? null : Newword.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GroupnwordsToJson(Groupnwords instance) =>
    <String, dynamic>{
      'wgroup': instance.wgroup,
      'groupwords': instance.groupwords,
    };
