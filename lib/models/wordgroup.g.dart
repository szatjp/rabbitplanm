// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordgroup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wordgroup _$WordgroupFromJson(Map<String, dynamic> json) {
  return Wordgroup()
    ..fid = json['fid'] as int
    ..fgroupnum = json['fgroupnum'] as String
    ..flan = json['flan'] as String
    ..fstateid = json['fstateid'] as String
    ..ffinitime = json['ffinitime'] as String
    ..fntime = json['fntime'] as String
    ..ffmemory = json['ffmemory'] as String;
}

Map<String, dynamic> _$WordgroupToJson(Wordgroup instance) => <String, dynamic>{
      'fid': instance.fid,
      'fgroupnum': instance.fgroupnum,
      'flan': instance.flan,
      'fstateid': instance.fstateid,
      'ffinitime': instance.ffinitime,
      'fntime': instance.fntime,
      'ffmemory': instance.ffmemory,
    };
