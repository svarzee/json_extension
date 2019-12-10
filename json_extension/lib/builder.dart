import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/json_generator.dart';

Builder jsonBuilder(BuilderOptions options) =>
    SharedPartBuilder([JsonGenerator()], '3_json',
        formatOutput: (code) => code);
