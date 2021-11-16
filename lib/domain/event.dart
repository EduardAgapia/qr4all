class Event {
  late String name;
  late String programm;
  late String location;
  late String description;

  Event(
      {required this.name,
      required this.programm,
      required this.location,
      required this.description});

  static Event fromRTDB(Map<String, dynamic> data) {
    return Event(
        name: data['events']['event1']['name'] ?? 'Do you rly whant it?',
        programm: data['events']['event1']['programm'] ?? 'Do you rly whant it?',
        location: data['events']['event1']['location'] ?? 'Do you rly whant it?',
        description: data['events']['event1']['description'] ?? 'Do you rly whant it?');
  }

  static List<Event> getList(Map<String, dynamic> data) {
    List<Event> eventList = List.empty(growable: true);
    Event event = fromRTDB(data);
    eventList.add(event);
    return eventList;
  }

  String fancyDescription() {
    return 'Evenimentul ' +
        name + '\n' + ' va avea loc la ' +
        location + '\n' + ' in intervalul orar ' +
        programm + '\n' + ' cu tema: ' +
        description + '\n';
  }
}
