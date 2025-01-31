import 'package:json_annotation/json_annotation.dart';
import 'ctype.dart';

part 'schema.g.dart';

@JsonSerializable(explicitToJson: true)
class Schema {
  String type;  // data_type: boolean, integer, number, string, array, object
  String? description;
  CType cType;

  Schema({required this.type, this.description, required this.cType});

  factory Schema.fromJson(Map<String, dynamic> json) {
    if (json["\$ref"] != null) {
      return _fromRef(json["\$ref"] as String);
    }
    return _$SchemaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchemaToJson(this);

  static Schema _fromRef(String ref) {
    List<String> parts = ref.split("/");
    if (parts[0] == "#" && parts[1] == "schemas") {
      String refName = parts[2];
      Schema? schema = SchemasSingleton.getInstance()[refName];
      if (schema != null) {
        return schema;
      } else {
        throw FormatException("#ref not found: $ref");
      }
    } else {
      throw FormatException("#ref format exception: $ref");
    }
  }
}

class SchemasSingleton {
  static Map<String, Schema> _schemas = {};

  static initInstance(Map<String, dynamic> schemasJson) {
    schemasJson.forEach((key, value) {
      String schemaName = key;
      Map<String, dynamic> schemaMap = value as Map<String, dynamic>;
      if (schemaMap["\$ref"] == null) {
        _schemas[schemaName] = Schema.fromJson(schemaMap);
      }
    });
  }

  static Map<String, Schema> getInstance() => _schemas;
}