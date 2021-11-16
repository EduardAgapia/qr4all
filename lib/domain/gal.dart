import 'package:qr_4_all/domain/event.dart';
import 'package:qr_4_all/domain/objective.dart';
import 'package:qr_4_all/domain/trail.dart';
import 'package:qr_4_all/domain/util_info.dart';

class Gal {
  late String name;
  late String description;
  late List<Event> events;
  late List<Objective> objectives;
  late List<Trail> trails;
  late UtilInfo utils;

  static Gal fromRTDB(Map<String, dynamic> data) {
    Gal gal = Gal();
    gal.name = data['name'] ?? 'Suck it!';
    gal.events = Event.getList(data);
    gal.objectives = Objective.getList(data);
    gal.trails = Trail.getList(data);
    gal.utils = UtilInfo.fromRTDB(data);
    return gal;
  }

  String fancyDescription() {
    return 'GAL-ul ' +
        name + '\n' +
        events[0].fancyDescription() + '\n' +
        objectives[0].fancyDescription() + '\n' +
        trails[0].fancyDescription() + '\n' +
        utils.fancyDescription() + '\n';
  }
}
