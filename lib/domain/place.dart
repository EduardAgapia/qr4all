import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class Place{
  String? type;
  String? location;


  Place(this.type, this.location);

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}