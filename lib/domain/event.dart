class Evenimente {
  String? name;
  String? programm;
  String? location;
  String? description;

  Evenimente(
      {required this.name,
      required this.programm,
      required this.location,
      required this.description});

  static Evenimente fromRTDB(Map<String, dynamic> data) {
    return Evenimente(
        name: data['events']['event1']['name'] ?? 'Do you rly whant it?',
        programm: data['events']['event1']['programm'] ?? 'Do you rly whant it?',
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
