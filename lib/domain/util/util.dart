import 'package:json_annotation/json_annotation.dart';

part 'util.g.dart';

@JsonSerializable()
class Util {
  String? police;
  String? restaurant;
  String? drugs;
  String? hotel;
  String? hospital;
  String? mayor;
  String? gasStation;
  String? serviceAuto;

  factory Util.fromJson(Map<String, dynamic> json) => _$UtilFromJson(json);

  Map<String, dynamic> toJson() => _$UtilToJson(this);

  Util(
      {required this.police,
      required this.restaurant,
      required this.drugs,
      required this.hotel,
      required this.hospital,
      required this.mayor,
      required this.gasStation,
      required this.serviceAuto});

  factory Util.fromRTDB(Map<String, dynamic> data) {
    return Util(
        police: data['utils']['police'] ?? 'ia cucu',
        restaurant: data['utils']['restaurant'] ?? 'ia cucu',
        drugs: data['utils']['drugStore'] ?? 'ia cucu',
        hotel: data['utils']['hotel'] ?? 'ia cucu',
        hospital: data['utils']['hospital'] ?? 'ia cucu',
        mayor: data['utils']['mayorHall'] ?? 'ia cucu',
        gasStation: data['utils']['gasStation'] ?? 'ia cucu',
        serviceAuto: data['utils']['serviceAuto'] ?? 'ia cucu');
  }
}