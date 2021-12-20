import 'package:json_annotation/json_annotation.dart';

part 'objective.g.dart';

@JsonSerializable()
class Objective {
  String? name;
  String? program;
  String? location;
  String? description;

  Objective(
      {required this.name,
      required this.program,
      required this.location,
      required this.description});

  factory Objective.fromJson(Map<String, dynamic> json) => _$ObjectiveFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectiveToJson(this);

}
