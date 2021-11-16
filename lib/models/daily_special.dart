class DailySpecial {
  final String description;
  final double price;

  DailySpecial({required this.description, required this.price});

  factory DailySpecial.fromRTDB(Map<String, dynamic> data) {
    return DailySpecial(
        description: data['description'] ?? 'Suck it!',
        price: data['price'] ?? 0.0);
  }

  String fancyDescription() {
    return this.description + ' suck for ' + this.price.toString();
  }
}
