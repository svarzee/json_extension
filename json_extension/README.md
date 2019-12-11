Description
---
Uses class_extensions and json_serializable to generate methods for object serialization from/to json map/string.

See also [withers_extension](https://pub.dev/packages/withers_extension), [to_string_extension](https://pub.dev/packages/to_string_extension)

Tutorial
---
1. We need a class to generate json serialization methods for.

    ##### `${PROJECT_ROOT}/lib/model.dart`
    ```dart
    import 'package:meta/meta.dart';
    
    @immutable
    class SomeValueClass {
      final String strVal;
      final int intVal;
    }
    ```

2. For json serialization to work you need to add some boiler plate:
    * `import 'dart:convert';`
    * `part 'model.g.dart';`
    * annotation `@Json()`
    * mixin `_$SomeValueClass`
    * all args constructor `SomeValueClass(this.strVal, this.intVal);`
    * factories `SomeValueClass.fromJson(Map<String, dynamic> json)` and `SomeValueClass.fromJsonString(String json)`

    ##### `${PROJECT_ROOT}/lib/model.dart`
    ```dart
    import 'dart:convert';
    
    import 'package:json_extension_annotations/annotations.dart';
    import 'package:meta/meta.dart';
    
    part 'model.g.dart';
    
    @Json()
    @immutable
    class SomeValueClass with _$SomeValueClass {
      final String strVal;
      final int intVal;
    
      SomeValueClass(this.strVal, this.intVal);
    
      factory SomeValueClass.fromJson(Map<String, dynamic> json) =>
          _$SomeValueClass.fromJson(json);
    
      factory SomeValueClass.fromJsonString(String json) =>
          _$SomeValueClass.fromJsonString(json);
    }
    ```

3. Configure code generation. More info at [build](https://github.com/dart-lang/build).

    ##### `${PROJECT_ROOT}/build.yaml`
    ```yaml
    targets:
      $default:
        builders:
          json_extension|json:
            generate_for:
            - lib/*.dart
    ```
4. Add dependencies.

    ##### `${PROJECT_ROOT}/pubspec.yaml`
    ```yaml
    name: example

    dependencies:
      class_extensions_annotations: ^0.1.0
      json_extension_annotations: ^0.1.0

    dev_dependencies:
      build_runner: ^1.0.0
      class_extensions: ^0.3.0
      json_extension: ^0.1.0
    ```

5. Run code generation: `pub run build_runner build`. File `${PROJECT_ROOT}/lib/model.g.dart` should be created.

6. If everything goes well you should be able to use json.

    ##### `${PROJECT_ROOT}/bin/main.dart`
    ```dart
    import 'package:example/model.dart';
    
    void main() {
      var some = SomeValueClass("some", 0);
    
      var jsonMap = some.toJson();
      var someFromMap = SomeValueClass.fromJson(jsonMap);
    
      var jsonString = some.toJsonString();
      var someFromString = SomeValueClass.fromJsonString(jsonString);
    }
    ```

7. You can also see the [example](https://github.com/svarzee/json_extension/tree/master/json_extension/example).
