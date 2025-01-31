# OpenModbus Specification

Version 1.0.0

## Introduction

The OpenDyn Specification (ODS) defines a standard, language-agnostic interface description for calling dynamic libraries (dll/dylib/so). It allows both humans and computers to discover and understand the functionalities of a dynamic library’s services without needing access to the source code or documentation. When defined correctly, consumers can understand and use tools supporting dynamic libraries with minimal implementation logic.

### Reference

The OpenDyn specification is referenced the the [OpenTool](https://github.com/LiteVar/opentool_dart/blob/main/opentool-specification-en.md) specification, with updates to the sections relevant to dynamic libraries.

### Objective

OpenModbus is aimed at describing programmatic invocations for the Dynamic Library and is designed to be used in conjunction with [OpenDynDriver](https://github.com/LiteVar/opentool_dart/blob/main/lib/src/driver/dyn/opendyn_driver.dart). This allows users to describe functions that can drive specific tools to execute function calls.

Similar to OpenTool, this can be conveniently used for:
1. Large language models' `Function Calling`, driving specific tools to complete function calls based on descriptions;
2. Workflow description calls, which, when combined with `OpenWorkflow` descriptions, can batch-drive tools to complete function calls.
   - This is useful for scenarios where large language models generate `OpenWorkflow` text to achieve time-sequenced tool function invocation. It is suitable for situations where functions need to be called in a fixed order.

## Objects

### OpenDyn Object

| Field     | Type                         | Description                                                                  |
|-----------|------------------------------|------------------------------------------------------------------------------|
| opendyn   | `string`                     | **Required**. The version of the current OpenDyn JSON document.              |
| info      | Info Object                  | **Required**. Information describing the current OpenDyn document.           |
| functions | \[Function Object\]          | **Required**. Describes the functions supported by the current tool call.    |
| schemas   | Map<`string`, Schema Object> | Describes the schema names and their input-output formats.                   |
| code      | Map<`string`, `string`>      | Success codes, exception codes, error codes, and their textual descriptions. |

### Info Object

| Field             | Type     | Description                                                                                                  |
|-------------------|----------|--------------------------------------------------------------------------------------------------------------|
| title             | `string` | **Required**. The title of the current OpenDyn JSON document.                                                |
| description       | `string` | A more detailed description of the current OpenDyn document.                                                 |
| version           | `string` | **Required**. The version number of the current document, for version management.                            |
| callingConvention | `string` | **Required**. The calling convention, optionally including cdecl (C declaration) or stdcall (Standard Call). |

### Function Object

| Field       | Type                 | Description                                                                                                                                                                                                                                                                                                         |
|-------------|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name        | `string`             | **Required**. The name of the function, which only includes a-z, A-Z, 0-9, -, and _ symbols, and must not exceed 64 characters. Referenced from OpenAI’s function.name description: `The name of the function to be called. Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.` |
| description | `string`             | **Required**. A description of the `function` for human readers and large language models to understand the function’s purpose.                                                                                                                                                                                     |
| parameters  | \[Parameter Object\] | **Required**. Describes the parameters for the function.                                                                                                                                                                                                                                                            |
| return      | Return Object        | Describes the function’s return parameter. If null, it means no return value.                                                                                                                                                                                                                                       |

### Parameter Object

| Field       | Type          | Description                                                                                                              |
|-------------|---------------|--------------------------------------------------------------------------------------------------------------------------|
| name        | `string`      | **Required**. The name of the parameter.                                                                                 |
| description | `string`      | A description of the `parameter` for human readers and large language models.                                            |
| schema      | Schema Object | **Required**. The format of the parameter.                                                                               |
| isIn        | `boolean`     | **Required**. Whether the parameter is an input parameter. If not, it is an output pointer parameter. Default is `true`. |
| required    | `boolean`     | **Required**. Whether the parameter is required. Default is `true`.                                                      |

### Return对象

| Field       | Type     | Description                                                                      |
|-------------|----------|----------------------------------------------------------------------------------|
| name        | `string` | **Required**. The name of the return value.                                      |
| description | `string` | A description of the `return` value for human readers and large language models. |
| schema      | Schema对象 | **Required**. The format of the return value.                                    |

### Schema Object

| Field       | Type         | Description                                                                                            |
|-------------|--------------|--------------------------------------------------------------------------------------------------------|
| type        | `string`     | **Required**. The type, which may include: `boolean`, `integer`, `number`, `string`, `array`, `object` |
| description | `string`     | A description of the current `type` for human readers and large language models.                       |
| cType       | CType Object | The corresponding C type for the current type.                                                         |

### CType Object

| Field     | Type      | Description                                                                                                                                                                                                           |
|-----------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type      | `string`  | **Required**. The C type, which may include: `void`, `bool`, `char`, `unsigned char`, `short`, `unsigned short`, `int`, `unsigned int`, `long`, `unsigned long`, `long long`, `unsigned long long`, `float`, `double` |
| isPointer | `boolean` | **Required**. Whether the parameter is a pointer. Default is `false`.                                                                                                                                                 |
