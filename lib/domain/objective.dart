class Objective {
  late String name;
  late String programm;
  late String location;
  late String description;

  Objective(
      {required this.name,
      required this.programm,
      required this.location,
      required this.description});

  static Objective fromRTDB(Map<String, dynamic> data) {
    var data2 = data['objectives'];
    return Objective(
        name: data['objectives']['obj1']['name'] ?? 'Do you rly whant it?',
        programm: data['objectives']['obj1']['programm'] ?? 'Do you rly whant it?',
        location: data['objectives']['obj1']['location'] ?? 'Do you rly whant it?',
        description: data['objectives']['obj1']['description'] ?? 'Do you rly whant it?');
  }

  static List<Objective> getList(Map<String, dynamic> data) {
    List<Objective> objList = List.empty(growable: true);
    Objective objective = fromRTDB(data);
    objList.add(objective);
    return objList;
  }

  String fancyDescription() {
    return 'Obiectivul ' +
        name + '\n'  + ' situat pe ' +
        location + '\n'  + ' are urmatorul program: ' +
        programm + '\n'  + ' cu descrierea: ' +
        description + '\n' ;
  }
}
