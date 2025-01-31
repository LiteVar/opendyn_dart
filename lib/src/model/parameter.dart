import 'package:json_annotation/json_annotation.dart';
import 'schema.dart';

part 'parameter.g.dart';

@JsonSerializable(explicitToJson: true)
class Parameter {
  String name;
  String? description;
  Schema schema;
  bool isIn;
  bool required;

  Parameter({required this.name, this.description, required this.schema, this.isIn = true, this.required = true});

  factory Parameter.fromJson(Map<String, dynamic> json) => _$ParameterFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}