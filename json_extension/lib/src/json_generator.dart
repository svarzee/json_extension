import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_extension_annotations/annotations.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends GeneratorForAnnotation<Json> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    ClassElement clazz = element;
    final out = StringBuffer();
    out.writeln(_generateToJson(clazz));
    out.writeln(_generateFromJson(clazz));
    return out.toString();
  }

  String _generateToJson(ClassElement clazz) {
    return '''Map<String, dynamic> toJson() => <String, dynamic>{
      ${_generateToJsonFields(clazz)}
     };''';
  }

  String _generateToJsonFields(ClassElement clazz) {
    return clazz.fields
        .map((field) => _generateToJsonField(clazz, field))
        .join(', \n');
  }

  String _generateToJsonField(ClassElement clazz, FieldElement field) {
    return "'${field.name}': (this as ${clazz.name}).${field.name}";
  }

  String _generateFromJson(ClassElement clazz) {
    return '''static ${clazz.name} fromJson(Map<String, dynamic> json) => ${_generateCtor(clazz)};''';
  }

  String _generateCtor(ClassElement clazz) {
    final out = StringBuffer();
    out.write('${clazz.name}(');
    out.write(clazz.unnamedConstructor.parameters
        .map((param) => _generateCtorArg(param))
        .join(', '));
    out.write(')');
    return out.toString();
  }

  String _generateCtorArg(ParameterElement param) {
    return "json['${param.name}'] as ${param.type.name}";
  }
}
