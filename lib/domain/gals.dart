import 'package:json_annotation/json_annotation.dart';

part 'gals.g.dart';

@JsonSerializable(explicitToJson: true)
class Gals{
  late List<Gals> gals;

  Gals();

  factory Gals.fromJson(Map<String, dynamic> json) => _$GalsFromJson(json);

  Map<String, dynamic> toJson() => _$GalsToJson(this);


}