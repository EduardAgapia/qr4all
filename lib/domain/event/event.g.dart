// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evenimente _$EvenimenteFromJson(Map<String, dynamic> json) => Evenimente(
      name: json['name'] as String?,
      program: json['program'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EvenimenteToJson(Evenimente instance) =>
    <String, dynamic>{
      'name': instance.name,
      'program': instance.program,
      'location': instance.location,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
