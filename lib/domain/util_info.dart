class UtilInfo {
  late String police;
  late String restaurant;
  late String drugs;
  late String hotel;
  late String hospital;
  late String mayor;
  late String gasStation;
  late String serviceAuto;

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

  String fancyDescription() {
    return 'Politia - ' +
        this.police + '\n'  +
        'Restaurant- ' +
        this.restaurant + '\n'  +
        'Farmacie- ' +
        this.drugs + '\n'  +
        'Hotel- ' +
        this.hotel + '\n'  +
        'Spital- ' +
        this.hospital + '\n'  +
        'Primarie- ' +
        this.mayor + '\n'  +
        'Benzinarie- ' +
        this.gasStation + '\n'  +
        'Vulcanizare- ' +
        this.serviceAuto + '\n' ;
  }
}
