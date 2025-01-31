class DataType {
  static const String BOOLEAN = "boolean";  // for bool
  static const String INTEGER = "integer";  // for int
  static const String NUMBER = "number";    // for double
  static const String STRING = "string";    // for String
  static const String ARRAY = "array";      // for List<dynamic>
  static const String OBJECT = "object";    // for Map<String, dynamic>
  static const String DYNAMIC = "dynamic";  // for dynamic
}

class CDataType {
  static const String VOID = "void"; // ffi.Void
  static const String BOOL = "bool"; // ffi.Int32（C bool 4 bytes）
  static const String CHAR = "char"; // ffi.Int8
  static const String UCHAR = "unsigned char"; // ffi.Uint16(Windows) or Int32(Linux)
  static const String SHORT = "short"; // ffi.Int16
  static const String USHORT = "unsigned short"; // ffi.Uint16
  static const String INT = "int"; // ffi.Int32
  static const String UINT = "unsigned int"; // ffi.Uint32
  static const String LONG = "long"; // ffi.Int32(Windows/Linux 4 bytes)
  static const String ULONG = "unsigned long"; // ffi.Uint32
  static const String LONGLONG = "long long"; // ffi.Int64
  static const String ULONGLONG = "unsigned long long"; // ffi.Uint64
  static const String FLOAT = "float"; // ffi.Float
  static const String DOUBLE = "double"; // ffi.Double
  // static const String STRUCT = "struct"; // Not support yet
  // static const String FUNCTION_CALLBACK = "function callback"; // Not support yet
}

class CallingConventionType {
  static const String CDECL = "cdecl";
  static const String STDCALL = "stdcall";
}
