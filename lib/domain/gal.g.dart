// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gal _$GalFromJson(Map<String, dynamic> json) => Gal()
  ..name = json['name'] as String?
  ..imgSrc = json['imgSrc'] as String?
  ..description = json['description'] as String?
  ..events = (json['events'] as List<dynamic>)
      .map((e) => Evenimente.fromJson(e as Map<String, dynamic>))
      .toList()
  ..objectives = (json['objectives'] as List<dynamic>)
      .map((e) => Objective.fromJson(e as Map<String, dynamic>))
      .toList()
  ..trails = (json['trails'] as List<dynamic>)
      .map((e) => Trail.fromJson(e as Map<String, dynamic>))
      .toList()
  ..utils = Util.fromJson(json['utils'] as Map<String, dynamic>);

Map<String, dynamic> _$GalToJson(Gal instance) => <String, dynamic>{
      'name': instance.name,
      'imgSrc': instance.imgSrc,
      'description': instance.description,
      'events': instance.events,
      'objectives': instance.objectives,
      'trails': instance.trails,
      'utils': instance.utils,
    };
