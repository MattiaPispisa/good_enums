import 'package:good_enums_annotations/good_enums_annotations.dart';

part 'environment.g.dart';

@goodEnum
enum Environment {
  dev,
  prod,
  stage;
}

@GoodEnum(
  enableMap: false,
)
enum EnvironmentLessGood {
  dev,
  prod,
  stage;
}

@GoodEnum(
  enableMap: false,
  enableMaybeMap: false,
)
enum EnvironmentLessLessGood {
  dev,
  prod,
  stage;
}

@GoodEnum(
  enableMap: false,
  enableMaybeMap: false,
  prefix: 'wowASpecialMethod'
)
enum SpecialEnvironment {
  dev,
  prod,
  stage;
}

