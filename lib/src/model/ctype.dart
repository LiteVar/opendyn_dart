import 'package:json_annotation/json_annotation.dart';

part 'ctype.g.dart';

@JsonSerializable()
class CType {
  String type;
  bool isPointer;

  CType({required this.type, this.isPointer = false});

  factory CType.fromJson(Map<String, dynamic> json) => _$CTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CTypeToJson(this);
}