// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'util.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Util _$UtilFromJson(Map<String, dynamic> json) => Util(
      police: Place.fromJson(json['police'] as Map<String, dynamic>),
      restaurant: Place.fromJson(json['restaurant'] as Map<String, dynamic>),
      drugs: Place.fromJson(json['drugs'] as Map<String, dynamic>),
      hotel: Place.fromJson(json['hotel'] as Map<String, dynamic>),
      hospital: Place.fromJson(json['hospital'] as Map<String, dynamic>),
      mayor: Place.fromJson(json['mayor'] as Map<String, dynamic>),
      gasStation: Place.fromJson(json['gasStation'] as Map<String, dynamic>),
      serviceAuto: Place.fromJson(json['serviceAuto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UtilToJson(Util instance) => <String, dynamic>{
      'police': instance.police.toJson(),
      'restaurant': instance.restaurant.toJson(),
      'drugs': instance.drugs.toJson(),
      'hotel': instance.hotel.toJson(),
      'hospital': instance.hospital.toJson(),
      'mayor': instance.mayor.toJson(),
      'gasStation': instance.gasStation.toJson(),
      'serviceAuto': instance.serviceAuto.toJson(),
    };
