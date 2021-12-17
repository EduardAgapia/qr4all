// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trail _$TrailFromJson(Map<String, dynamic> json) => Trail(
      name: json['name'] as String?,
      program: json['program'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TrailToJson(Trail instance) => <String, dynamic>{
      'name': instance.name,
      'program': instance.program,
      'location': instance.location,
      'description': instance.description,
    };
