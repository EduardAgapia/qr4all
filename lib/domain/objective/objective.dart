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

  static Objective fromRTDB(Map<String, dynamic> data) {
    var data2 = data['objectives'];
    return Objective(
        name: data['objectives']['obj1']['name'] ?? 'Do you rly whant it?',
        program: data['objectives']['obj1']['programm'] ?? 'Do you rly whant it?',
        location: data['objectives']['obj1']['location'] ?? 'Do you rly whant it?',
        description: data['objectives']['obj1']['description'] ?? 'Do you rly whant it?');
  }

  static List<Objective> getList(Map<String, dynamic> data) {
    List<Objective> objList = List.empty(growable: true);
    Objective objective = fromRTDB(data);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);
    objList.add(objective);

    return objList;
  }
}
