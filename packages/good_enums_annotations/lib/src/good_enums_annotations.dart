/// {@template good_enums_annotations}
/// Good enum annotations
/// {@endtemplate}
class GoodEnum {
  /// {@macro good_enums_annotations}
  const GoodEnum({
    this.prefix = 'is',
    this.enableMap = true,
  });

  /// prefix compare utility
  final String prefix;

  /// enable/disable map method
  final bool enableMap;
}

/// default GoodEnums instance
const goodEnum = GoodEnum();
