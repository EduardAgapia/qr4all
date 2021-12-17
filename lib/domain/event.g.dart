// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evenimente _$EvenimenteFromJson(Map<String, dynamic> json) => Evenimente(
      name: json['name'] as String?,
      programm: json['programm'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$EvenimenteToJson(Evenimente instance) =>
    <String, dynamic>{
      'name': instance.name,
      'programm': instance.programm,
      'location': instance.location,
      'description': instance.description,
    };
