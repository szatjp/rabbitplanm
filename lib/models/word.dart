import 'package:json_annotation/json_annotation.dart';


part 'word.g.dart';

@JsonSerializable()
class Word {
      Word();

  String fwordno;
  String fword;
  String fpronunciation;
  String fwordclass;
  dynamic frelaword;

  factory Word.fromJson(Map<String,dynamic> json) => _$WordFromJson(json);
  Map<String, dynamic> toJson() => _$WordToJson(this);
}
