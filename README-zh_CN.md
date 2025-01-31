# opendyn_dart

[English](README.md) · 中文

一个用于 Dart 的 OpenDyn JSON 规范解析器

灵感来源于OpenAPI、OpenRPC和OpenAI的 `function calling`示例。

## 功能

- 加载 OpenTool JSON 文件，并转换为 Dart 对象。 见 [OpenDyn规范](opendyn-specification-cn).

## 用法

根据 `/example/opendyn_dart_example.dart` 示例进行操作。

- 从 JSON 字符串加载
```dart
Future<void> main() async {
  String jsonString = "{...OpenDyn String...}";
  OpenDynLoader openDynLoader = OpenDynLoader();
  OpenDyn openDyn = await openDynLoader.load(jsonString);
}
```
- 从 JSON 文件加载
```dart
Future<void> main() async {
  String jsonPath = "$currentWorkingDirectory/example/json/$jsonFileName";
  OpenDynLoader openDynLoader = OpenDynLoader();
  OpenDyn openDyn = await openDynLoader.loadFromFile(jsonPath); 
}
```