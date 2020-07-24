import 'package:json_annotation/json_annotation.dart';


part 'newwords.g.dart';

@JsonSerializable()
class Newwords {
      Newwords();

  int fid;
  String fnewword;
  String fword;
  String fpronunciation;
  String fwordclass;
  int fgroup;
  String fgroupnum;
  String fnote;

  factory Newwords.fromJson(Map<String,dynamic> json) => _$NewwordsFromJson(json);
  Map<String, dynamic> toJson() => _$NewwordsToJson(this);
}
