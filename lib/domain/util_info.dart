import 'package:qr_4_all/domain/place.dart';

class UtilInfo {
  String? police;
  String? restaurant;
  String? drugs;
  String? hotel;
  String? hospital;
  String? mayor;
  String? gasStation;
  String? serviceAuto;

  UtilInfo(
      {required this.police,
      required this.restaurant,
      required this.drugs,
      required this.hotel,
      required this.hospital,
      required this.mayor,
      required this.gasStation,
      required this.serviceAuto});

  factory UtilInfo.fromRTDB(Map<String, dynamic> data) {
    return UtilInfo(
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
