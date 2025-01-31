import 'dart:convert';

import 'package:opendyn_dart/opendyn_dart.dart';

import 'dart:io';

void main() async {
  String folder = "${Directory.current.path}${Platform.pathSeparator}example${Platform.pathSeparator}json";
  List<String> jsonFileNameList = ["example.json"];

  jsonFileNameList.forEach((jsonFileName) async {
    print("FILE_NAME: $jsonFileName");
    String jsonPath = "$folder${Platform.pathSeparator}$jsonFileName";
    OpenDynLoader openDynLoader = OpenDynLoader();
    OpenDyn openDyn = await openDynLoader.loadFromFile(jsonPath);
    // JsonEncoder.withIndent('  ').convert(openDyn.toJson());
    print("```json\n${JsonEncoder.withIndent('  ').convert(openDyn.toJson())}\n```");
  });
}
