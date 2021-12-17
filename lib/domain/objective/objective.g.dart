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
    );

Map<String, dynamic> _$ObjectiveToJson(Objective instance) => <String, dynamic>{
      'name': instance.name,
      'program': instance.program,
      'location': instance.location,
      'description': instance.description,
    };
