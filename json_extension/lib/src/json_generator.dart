import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:class_extensions/class_extensions.dart';
import 'package:json_extension_annotations/annotations.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends ClassExtensionGenerator<Json> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    ClassElement clazz = element;
    final out = StringBuffer();
    out.writeln(_generateToJson(clazz));
    out.writeln(_generateToJsonString(clazz));
    out.writeln(_generateFromJson(clazz));
    out.writeln(_generateFromJsonString(clazz));
    return out.toString();
  }

  String _generateToJson(ClassElement clazz) {
    return 'Map<String, dynamic> toJson() => _\$${clazz.name}ToJson(this as ${clazz.name});';
  }

  String _generateToJsonString(ClassElement clazz) {
    return 'String toJsonString() => json.encode(toJson());';
  }

  String _generateFromJson(ClassElement clazz) {
    return 'static ${clazz.name} fromJson(Map<String, dynamic> jsonMap) => _\$${clazz.name}FromJson(jsonMap);';
  }

  String _generateFromJsonString(ClassElement clazz) {
    return 'static ${clazz.name} fromJsonString(String jsonString) => fromJson(json.decode(jsonString));';
  }
}
