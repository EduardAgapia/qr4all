import 'package:json_annotation/json_annotation.dart';
import 'package:qr_4_all/domain/gal/gal.dart';

part 'gals.g.dart';

@JsonSerializable(explicitToJson: true)
class Gals{
  late List<Gal> gals;

  Gals();

  factory Gals.fromJson(Map<String, dynamic> json) => _$GalsFromJson(json);

  Map<String, dynamic> toJson() => _$GalsToJson(this);


}