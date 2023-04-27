import 'package:good_enums_annotations/good_enums_annotations.dart';

part 'environment.g.dart';

@goodEnum
enum Environment {
  dev,
  prod,
  stage;
}

@GoodEnum(
  enableIf: false,
  valueCheckAsGetter: true,
)
enum EnvironmentLessGood {
  dev,
  prod,
  stage;

  bool ifIs<int>() {
    return true;
  }
}

@GoodEnum(
  enableIf: false,
  enableMaybeIf: false,
)
enum EnvironmentLessLessGood {
  dev,
  prod,
  stage;
}

@GoodEnum(enableIf: false, enableMaybeIf: false, prefix: 'wowASpecialMethod')
enum SpecialEnvironment {
  dev,
  prod,
  stage;
}
