# opendyn_dart

English · [中文](README-zh_CN.md)

An OpenDyn JSON Spec Parser for dart.

Inspired by OpenAPI, OpenRPC, and OpenAI `function calling` example.

## Features

- Load OpenDyn json file, and convert to dart object. See [OpenDyn Specification](opendyn-specification-en.md).

## Usage

According to `/example/opendyn_dart_example.dart`.

- From JSON String
```dart
Future<void> main() async {
  String jsonString = "{...OpenDyn String...}";
  OpenDynLoader openDynLoader = OpenDynLoader();
  OpenDyn openDyn = await openDynLoader.load(jsonString);
}
```
- From JSON File
```dart
Future<void> main() async {
  String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
  OpenDynLoader openDynLoader = OpenDynLoader();
  OpenDyn openDyn = await openDynLoader.loadFromFile(jsonPath); 
}
```