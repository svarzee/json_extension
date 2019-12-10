import 'package:example/model.dart';

void main() {
  var json = SomeValueClass("some", 0).toJson();
  print(json);
  var some = SomeValueClass.fromJson(json);
  print(some.toJson());
}
