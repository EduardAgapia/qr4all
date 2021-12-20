import 'package:json_annotation/json_annotation.dart';

part 'trail.g.dart';

@JsonSerializable()
class Trail {
  String? name;
  String? program;
  String? location;
  String? description;

  Trail(
      {required this.name,
      required this.program,
      required this.location,
      required this.description});

  factory Trail.fromJson(Map<String, dynamic> json) => _$TrailFromJson(json);

  Map<String, dynamic> toJson() => _$TrailToJson(this);

}
