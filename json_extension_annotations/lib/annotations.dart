import 'package:class_extensions_annotations/annotations.dart';
import 'package:json_annotation/json_annotation.dart';

class Json extends JsonSerializable implements Extension {
  const Json({
    bool anyMap,
    bool checked,
    bool createFactory,
    bool createToJson,
    bool disallowUnrecognizedKeys,
    bool explicitToJson,
    FieldRename fieldRename,
    bool ignoreUnannotated,
    bool includeIfNull,
    bool nullable,
  }) : super(
            anyMap: anyMap,
            checked: checked,
            createFactory: createFactory,
            createToJson: createToJson,
            disallowUnrecognizedKeys: disallowUnrecognizedKeys,
            explicitToJson: explicitToJson,
            fieldRename: fieldRename,
            ignoreUnannotated: ignoreUnannotated,
            includeIfNull: includeIfNull,
            nullable: nullable);
}
