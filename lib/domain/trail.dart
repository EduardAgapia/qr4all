class Trail {
  late String name;
  late String programm;
  late String location;
  late String description;

  Trail(
      {required this.name,
      required this.programm,
      required this.location,
      required this.description});

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
    return trailList;
  }

  String fancyDescription() {
    return 'Traseul ' +
        this.name + '\n'  +
        ' situat pe ' +
        this.location + '\n'  +
        ' are urmatorul program: ' +
        this.programm + '\n'  +
        ' cu descrierea: ' +
        this.description + '\n' ;
  }
}
