// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gals _$GalsFromJson(Map<String, dynamic> json) => Gals()
  ..gals = (json['gals'] as List<dynamic>)
      .map((e) => Gals.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$GalsToJson(Gals instance) => <String, dynamic>{
      'gals': instance.gals.map((e) => e.toJson()).toList(),
    };
