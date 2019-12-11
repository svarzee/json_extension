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
