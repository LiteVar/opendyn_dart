import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  late String title;
  String? description;
  late String version;
  late String callingConvention;

  Info({required this.title, this.description, required this.version, required this.callingConvention});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}