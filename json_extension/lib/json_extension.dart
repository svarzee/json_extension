import 'package:build/build.dart';
import 'package:class_extensions/class_extensions.dart';

import 'src/json_generator.dart';

Builder jsonDummyBuilder(BuilderOptions options) =>
    registerClassExtensionGenerator(3, JsonGenerator());
