/// {@template good_enums_annotations}
/// Good enum annotations
/// {@endtemplate}
class GoodEnum {
  /// {@macro good_enums_annotations}
  const GoodEnum({
    this.prefix = 'is',
    this.enableIf = true,
    this.enableMaybeIf = true,
    this.valueCheckAsGetter = false,
  });

  /// utilities prefix
  final String prefix;

  /// enable/disable if method
  final bool enableIf;

  /// enable/disable maybeIf method
  final bool enableMaybeIf;

  /// ```dart
  /// enum Env {
  ///   dev,
  /// }
  /// ```
  /// with `valueCheckAsGetter=true`
  /// ```dart
  /// env.isDev
  /// ```
  ///
  /// with `valueCheckAsGetter=false`
  /// ```dart
  /// env.isDev()
  /// ```
  final bool valueCheckAsGetter;
}

/// default GoodEnums instance
const goodEnum = GoodEnum();
