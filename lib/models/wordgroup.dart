import 'package:json_annotation/json_annotation.dart';


part 'wordgroup.g.dart';

@JsonSerializable()
class Wordgroup {
      Wordgroup();

  int fid;
  String fgroupnum;
  String flan;
  String fstateid;
  String fstatename;
  String ffinitime;
  String fntime;
  String ffmemory;

  factory Wordgroup.fromJson(Map<String,dynamic> json) => _$WordgroupFromJson(json);
  Map<String, dynamic> toJson() => _$WordgroupToJson(this);
}
