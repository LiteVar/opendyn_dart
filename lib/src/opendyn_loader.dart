import 'dart:convert';
import 'dart:io';

import 'model/open_dyn.dart';

class OpenDynLoader {
  Future<OpenDyn> load(String jsonString) async {
    Map<String, dynamic> openDynMap = jsonDecode(jsonString);
    OpenDyn openDyn = OpenDyn.fromJson(openDynMap);
    return openDyn;
  }

  Future<OpenDyn> loadFromFile(String jsonPath) async {
    File file = File(jsonPath);
    String jsonString = await file.readAsString();
    return load(jsonString);
  }
}