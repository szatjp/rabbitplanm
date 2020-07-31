import 'package:json_annotation/json_annotation.dart';
import 'word.dart';

part 'newword.g.dart';

@JsonSerializable()
class Newword {
      Newword();

  Word fnewword;
  int fid;
  String fnote;

  factory Newword.fromJson(Map<String,dynamic> json) => _$NewwordFromJson(json);
  Map<String, dynamic> toJson() => _$NewwordToJson(this);
}
