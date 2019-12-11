import 'package:example/model.dart';

void main() {
  var some = SomeValueClass("some", 0);

  var jsonMap = some.toJson();
  var someFromMap = SomeValueClass.fromJson(jsonMap);

  var jsonString = some.toJsonString();
  var someFromString = SomeValueClass.fromJsonString(jsonString);
}
