// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parameter _$ParameterFromJson(Map<String, dynamic> json) => Parameter(
      name: json['name'] as String,
      description: json['description'] as String?,
      schema: Schema.fromJson(json['schema'] as Map<String, dynamic>),
      isIn: json['isIn'] as bool? ?? true,
      required: json['required'] as bool? ?? true,
    );

Map<String, dynamic> _$ParameterToJson(Parameter instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'schema': instance.schema.toJson(),
      'isIn': instance.isIn,
      'required': instance.required,
    };
