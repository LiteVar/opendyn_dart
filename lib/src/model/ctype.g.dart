// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ctype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CType _$CTypeFromJson(Map<String, dynamic> json) => CType(
      type: json['type'] as String,
      isPointer: json['isPointer'] as bool? ?? false,
    );

Map<String, dynamic> _$CTypeToJson(CType instance) => <String, dynamic>{
      'type': instance.type,
      'isPointer': instance.isPointer,
    };
