import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qr_4_all/domain/event/event.dart';
import 'package:qr_4_all/domain/objective/objective.dart';
import 'package:qr_4_all/domain/trail/trail.dart';
import 'package:qr_4_all/domain/util/util.dart';

part 'gal.g.dart';

@JsonSerializable(explicitToJson: true)
class Gal {
  static DatabaseReference database = FirebaseDatabase.instance.reference();

  String? name;
  String? imgSrc;
  String? description;
  late List<Evenimente> events;
  late List<Objective> objectives;
  late List<Trail> trails;
  // late Util util;

  Gal(
      {required this.name,
      required this.imgSrc,
      required this.description,
      required this.events,
      required this.objectives,
      required this.trails});

  factory Gal.fromJson(Map<String, dynamic> json) => _$GalFromJson(json);

  Map<String, dynamic> toJson() => _$GalToJson(this);
}
