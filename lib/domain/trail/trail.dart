import 'package:json_annotation/json_annotation.dart';

part 'trail.g.dart';

@JsonSerializable()
class Trail {
  String? name;
  String? programm;
  String? location;
  String? description;

  Trail(
      {required this.name,
      required this.programm,
      required this.location,
      required this.description});

  factory Trail.fromJson(Map<String, dynamic> json) => _$TrailFromJson(json);

  Map<String, dynamic> toJson() => _$TrailToJson(this);

  static Trail fromRTDB(Map<String, dynamic> data) {
    return Trail(
        name: data['trails']['trail1']['name'] ?? 'Do you rly whant it?',
        programm: data['trails']['trail1']['programm'] ?? 'Do you rly whant it?',
        location: data['trails']['trail1']['location'] ?? 'Do you rly whant it?',
        description: data['trails']['trail1']['description'] ?? 'Do you rly whant it?');
  }

  static List<Trail> getList(Map<String, dynamic> data) {
    List<Trail> trailList = List.empty(growable: true);
    Trail trail = fromRTDB(data);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    trailList.add(trail);
    return trailList;
  }
}
