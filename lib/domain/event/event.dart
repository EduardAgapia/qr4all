import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Evenimente {
  String? name;
  String? program;
  String? location;
  String? description;

  Evenimente(
      {required this.name,
      required this.program,
      required this.location,
      required this.description});

  factory Evenimente.fromJson(Map<String, dynamic> json) => _$EvenimenteFromJson(json);

  Map<String, dynamic> toJson() => _$EvenimenteToJson(this);

}
