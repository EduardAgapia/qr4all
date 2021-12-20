import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  String? name;
  String? type;
  double? latitude;
  double? longitude;
  String? image;

  Place(this.name, this.type, this.latitude, this.longitude, this.image);

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
