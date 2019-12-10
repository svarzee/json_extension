Description
---
Uses class_extensions to generate methods for object serialization from/to json.

See also [to_string_extension](https://pub.dev/packages/to_string_extension), [json_extension](https://pub.dev/packages/json_extension)

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
    * `part 'model.g.dart';`
    * annotation `@Json()`
    * mixin `_$SomeValueClass`
    * all args constructor `SomeValueClass(this.strVal, this.intVal);`

    ##### `${PROJECT_ROOT}/lib/model.dart`
    ```dart
    import 'package:meta/meta.dart';
    import 'package:json_extension_annotations/annotations.dart';
    
    part 'model.g.dart';
    
    @Json()
    @immutable
    class SomeValueClass with _$SomeValueClass {
      final String strVal;
      final int intVal;
    
      SomeValueClass(this.strVal, this.intVal);
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
      var json = SomeValueClass("some", 0);
    }
    ```

7. You can also see the [example](https://github.com/svarzee/json_extension/tree/master/json_extension/example).
