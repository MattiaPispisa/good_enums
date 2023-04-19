/// Good enum code generation
library good_enums;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'good_enums.dart';

export 'src/good_enums_generator.dart';

Builder goodEnum(BuilderOptions options) => SharedPartBuilder(
      [GoodEnumsGenerator()],
      'good_enum',
    );
