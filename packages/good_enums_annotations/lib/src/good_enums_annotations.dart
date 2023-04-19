/// {@template good_enums_annotations}
/// Good enum annotations
/// {@endtemplate}
class GoodEnum {
  /// {@macro good_enums_annotations}
  const GoodEnum({
    this.prefix = 'is',
    this.enableMap = true,
    this.enableMaybeMap = true,
  });

  /// prefix compare utility
  final String prefix;

  /// enable/disable map method
  final bool enableMap;

  /// enable/disable maybeMap method
  final bool enableMaybeMap;
}

/// default GoodEnums instance
const goodEnum = GoodEnum();
