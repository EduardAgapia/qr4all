// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Objective _$ObjectiveFromJson(Map<String, dynamic> json) => Objective(
      name: json['name'] as String?,
      program: json['program'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ObjectiveToJson(Objective instance) => <String, dynamic>{
      'name': instance.name,
      'program': instance.program,
      'location': instance.location,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
