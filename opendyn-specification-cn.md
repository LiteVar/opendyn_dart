# OpenDyn规范

版本 1.0.0

## 介绍

OpenDyn规范（ODS）定义了动态库（Dynamic Library, dll/dylib/so）工具调用的标准、语言无关的接口描述，允许人类和计算机发现和理解动态库服务的功能，而无需访问源代码和文档。如果定义正确，消费者只需使用最少的实现逻辑即可理解和使用支持动态库的工具。

### 参考

OpenDyn规范参考了[OpenTool](https://github.com/LiteVar/opentool_dart/blob/main/opentool-specification-cn.md)规范，更新了针对动态库的部分。

### 目标

OpenDyn面向动态库的程序调用描述，并且配合[OpenDynDriver](https://github.com/LiteVar/opentool_dart/blob/main/lib/src/driver/dyn/opendyn_driver.dart)使用，达到用户描述函数，可以驱动具体工具执行函数调用

与OpenTool一致，这将很方便地用于：
1. 大语言模型的`Function Calling`，根据描述，驱动具体工具完成函数调用；
2. 工作流描述调用，结合`OpenWorkflow`描述，可以批量驱动工具完成函数调用。
    - 这对于让大语言模型生成`OpenWorkflow`文本，可以达到按时序驱动工具函数调用的效果。适合于需要按固定顺序调用函数的场景。

## 对象

### OpenDyn对象

| 字段        | 类型                      | 描述                         |
|-----------|-------------------------|----------------------------|
| opendyn   | `string`                | **必填**。当前OpenDyn的JSON文档版本。 |
| info      | Info对象                  | **必填**。描述当前OpenDyn文档的信息。   |
| functions | \[Function对象\]          | **必填**。描述当前工具调用支持的函数信息。    |
| schemas   | Map<`string`, Schema对象> | 描述`schema`名称及其输入输出的格式      |
| code      | Map<`string`, `string`> | 成功码、异常码、错误码及其文字描述。         |

### Info对象

| 字段                | 类型       | 描述                                                               |
|-------------------|----------|------------------------------------------------------------------|
| title             | `string` | **必填**。当前OpenDyn的JSON文档的标题。                                      |
| description       | `string` | 当前OpenDyn文档的更详细的描述信息。                                            |
| version           | `string` | **必填**。当前文档的版本号，用于文档版本管理。                                        |
| callingConvention | `string` | **必填**。调用约定，可选包括`cdecl`（C declaration）、`stdcall`（Standard Call）。 |

### Function对象

| 字段          | 类型              | 描述                                                                                                                                                                                                    |
|-------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name        | `string`        | **必填**。函数的名称，只包含a-z、A-Z、0-9、-、_符号，且不超过64个字符。参考自OpenAI的function.name描述：`The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.` |
| description | `string`        | **必填**。函数的描述，用于人类和大语言模型阅读当前function的作用。                                                                                                                                                               |
| parameters  | \[Parameter对象\] | **必填**。函数的传入参数的描述。                                                                                                                                                                                    |
| return      | Return对象        | 函数返回参数的描述。如果为`null`，则表示无返回值                                                                                                                                                                           |

### Parameter对象

| 字段          | 类型        | 描述                                     |
|-------------|-----------|----------------------------------------|
| name        | `string`  | **必填**。参数的名称。                          |
| description | `string`  | 参数的描述，用于人类和大语言模型阅读当前参数的作用。             |
| schema      | Schema对象  | **必填**。参数的格式。                          |
| isIn        | `boolean` | **必填**。参数是否输入参数，否则则为指针输出参数，默认为 `true`。 |
| required    | `boolean` | **必填**。参数是否必填，默认为 `true`。              |

### Return对象

| 字段          | 类型        | 描述                          |
|-------------|-----------|-----------------------------|
| name        | `string`  | **必填**。返回值的名称。              |
| description | `string`  | 返回值的描述，用于人类和大语言模型阅读当前参数的作用。 |
| schema      | Schema对象  | **必填**。返回值的格式。              |

### Schema对象

| 字段          | 类型       | 描述                                                                    |
|-------------|----------|-----------------------------------------------------------------------|
| type        | `string` | **必填**。类型，可选包括：`boolean`、`integer`、`number`、`string`、`array`、`object` |
| description | `string` | 当前`type`的描述，用于人类和大语言模型阅读当前格式的作用。                                      |
| cType       | CType对象  | 当前`type`对应的C Type                                                     |

### CType对象

| 字段        | 类型        | 描述                                                                                                                                                                          |
|-----------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type      | `string`  | **必填**。C类型，可选包括：`void`、`bool`、`char`、`unsigned char`、`short`、`unsigned short`、`int`、`unsigned int`、`long`、`unsigned long`、`long long`、`unsigned long long`、`float`、`double` |
| isPointer | `boolean` | **必填**。参数是否必填，默认为 `false`。                                                                                                                                                  |
