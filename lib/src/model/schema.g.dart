// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map<String, dynamic> json) => Schema(
      type: json['type'] as String,
      description: json['description'] as String?,
      cType: CType.fromJson(json['cType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SchemaToJson(Schema instance) => <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
      'cType': instance.cType.toJson(),
    };
