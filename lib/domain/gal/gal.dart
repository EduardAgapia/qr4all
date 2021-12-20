import 'package:json_annotation/json_annotation.dart';
import 'package:qr_4_all/domain/event/event.dart';
import 'package:qr_4_all/domain/objective/objective.dart';
import 'package:qr_4_all/domain/place/place.dart';
import 'package:qr_4_all/domain/trail/trail.dart';

part 'gal.g.dart';

@JsonSerializable(explicitToJson: true)
class Gal {

  String? name;
  String? imgSrc;
  String? description;
  late List<Evenimente> events;
  late List<Objective> objectives;
  late List<Trail> trails;
  late List<Place> utils;

  Gal(
      {required this.name,
      required this.imgSrc,
      required this.description,
      required this.events,
      required this.objectives,
      required this.trails,
      required this.utils});

  factory Gal.fromJson(Map<String, dynamic> json) => _$GalFromJson(json);

  Map<String, dynamic> toJson() => _$GalToJson(this);
}
