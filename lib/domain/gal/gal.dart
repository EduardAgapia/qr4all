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
  late Util utils;

  factory Gal.fromJson(Map<String, dynamic> json) => _$GalFromJson(json);

  Gal();

  //ToDO: msyde delete what is under?

  static Gal fromRTDB(Map<String, dynamic> data, String imgSrc) {
    Gal gal = Gal();
    gal.imgSrc = imgSrc;
    gal.name = data['name'] ?? 'Suck it!';
    gal.events = Evenimente.getList(data);
    gal.objectives = Objective.getList(data);
    gal.trails = Trail.getList(data);
    gal.utils = Util.fromRTDB(data);
    return gal;
  }

  static Gal galProcessing(String galName, String imgSrc) {
    Gal gal = Gal();
    database.child(galName).get().then((snapshot) {
      gal = fromRTDB(Map<String, dynamic>.from(snapshot!.value), imgSrc);
      gals.add(gal);
    });
    return gal;
  }

  static List<Gal> gals = List.empty(growable: true);
  static List<Gal> _galList = List.empty(growable: true);

  static List<Gal> performSingleFetch() {
    _galList.add(galProcessing('belcesti-focuri', "assets/gals/belcesti.png"));
    _galList.add(galProcessing('codrii-pascanilor', "assets/gals/pascani.png"));
    _galList
        .add(galProcessing('dealurile-bohotinului', "assets/gals/bohotin.png"));
    _galList.add(galProcessing('rediu-prajeni', "assets/gals/rediu.png"));
    _galList.add(galProcessing('siret-moldova', "assets/gals/siret.png"));
    _galList.add(galProcessing('stefan-cel-mare', "assets/gals/stefan.png"));
    _galList.add(galProcessing('stejarii-argintii', "assets/gals/stejari.png"));
    _galList.add(galProcessing('valuea-prutului', "assets/gals/prut.png"));
    _galList.add(galProcessing('colinele-iasului', "assets/gals/iasi.png"));
    return _galList;
  }

  static List<Gal> get galList => gals;
}
