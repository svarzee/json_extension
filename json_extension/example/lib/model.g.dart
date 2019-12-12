// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

mixin _$SomeValueClass {
  Map<String, dynamic> toJson() =>
      _$SomeValueClassToJson(this as SomeValueClass);
  String toJsonString() => json.encode(toJson());
  static SomeValueClass fromJson(Map<String, dynamic> jsonMap) =>
      _$SomeValueClassFromJson(jsonMap);
  static SomeValueClass fromJsonString(String jsonString) =>
      fromJson(json.decode(jsonString));
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SomeValueClass _$SomeValueClassFromJson(Map<String, dynamic> json) {
  return SomeValueClass(
    json['strVal'] as String,
    json['intVal'] as int,
  );
}

Map<String, dynamic> _$SomeValueClassToJson(SomeValueClass instance) =>
    <String, dynamic>{
      'strVal': instance.strVal,
      'intVal': instance.intVal,
    };
