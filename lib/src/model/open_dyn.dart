import 'package:json_annotation/json_annotation.dart';
import 'function_model.dart';
import 'info.dart';
import 'schema.dart';

part 'open_dyn.g.dart';

@JsonSerializable(explicitToJson: true)
class OpenDyn {
  late String opendyn;
  late Info info;
  late List<FunctionModel> functions;
  late Map<String, Schema>? schemas;
  late Map<String, String>? code;

  OpenDyn({required this.opendyn, required this.info, required this.functions});

  factory OpenDyn.fromJson(Map<String, dynamic> json) => _$OpenDynFromJson(json);

  Map<String, dynamic> toJson() => _$OpenDynToJson(this);
}