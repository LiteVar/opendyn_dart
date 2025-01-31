// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_dyn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenDyn _$OpenDynFromJson(Map<String, dynamic> json) => OpenDyn(
      opendyn: json['opendyn'] as String,
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      functions: (json['functions'] as List<dynamic>)
          .map((e) => FunctionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..schemas = (json['schemas'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Schema.fromJson(e as Map<String, dynamic>)),
      )
      ..code = (json['code'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      );

Map<String, dynamic> _$OpenDynToJson(OpenDyn instance) => <String, dynamic>{
      'opendyn': instance.opendyn,
      'info': instance.info.toJson(),
      'functions': instance.functions.map((e) => e.toJson()).toList(),
      'schemas': instance.schemas?.map((k, e) => MapEntry(k, e.toJson())),
      'code': instance.code,
    };
