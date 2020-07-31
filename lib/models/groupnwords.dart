import 'package:json_annotation/json_annotation.dart';
import 'wordgroup.dart';
import 'newword.dart';

part 'groupnwords.g.dart';

@JsonSerializable()
class Groupnwords {
      Groupnwords();

  Wordgroup wgroup;
  List<Newword> groupwords;

  factory Groupnwords.fromJson(Map<String,dynamic> json) => _$GroupnwordsFromJson(json);
  Map<String, dynamic> toJson() => _$GroupnwordsToJson(this);
}
