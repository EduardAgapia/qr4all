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


  static Evenimente fromRTDB(Map<String, dynamic> data) {
    var json  = data['events'];
    debugPrint('------------------------------------------------>: $json');//deci se poate
    return Evenimente(
        name: data['events']['event1']['name'] ?? 'Do you rly whant it?',
        program: data['events']['event1']['programm'] ?? 'Do you rly whant it?',
        location: data['events']['event1']['location'] ?? 'Do you rly whant it?',
        description: data['events']['event1']['description'] ?? 'Do you rly whant it?');
  }

  static List<Evenimente> getList(Map<String, dynamic> data) {
    List<Evenimente> eventList = List.empty(growable: true);
    Evenimente event = fromRTDB(data);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    eventList.add(event);
    return eventList;
  }
}
