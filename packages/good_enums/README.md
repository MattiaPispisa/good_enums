# Good Enums

Code generator to make enums easier to use. Annotations lib [here](https://pub.dev/packages/good_enums_annotations).

## Setup

See the [example](https://github.com/MattiaPispisa/good_enums/tree/main/example) for the configuration.

```yaml
dependencies:
  flutter:
    sdk: flutter
  good_enums_annotations:

dev_dependencies:
  build_runner:
  good_enums:
```

## Example

Annotate the enum.

```dart
import 'package:good_enums_annotations/good_enums_annotations.dart';
part 'environment.g.dart';

@goodEnum
enum Environment {
  dev,
  prod,
  stage;
}
```

Functions created:

- For each field an `isField` method

```dart
if (environment.isDev()) {
  // do
  return;
}
// else
```

if `valueCheckAsGetter` is set to `true`
```dart
if (environment.isDev) {
  // do
  return;
}
// else
```

- Method `ifIs` with a callback for each enum field:

```dart
return environment.ifIs(
          dev: () => Text("IsDev"),
          prod: () => Text("IsProd"),
          stage: () => Text("IsStage"),
        );
```

- Method `maybeIfIs` with an **optional** callback for each enum field and an else case:

```dart
return environment.maybeIfIs(
          dev: () => Text("IsDev"),
          orElse: () => Text("IsElse"),
        );
```

Code generated:

```dart
extension GoodEnvironment on Environment {
  bool isDev() {
    return this == Environment.dev;
  }

  bool isProd() {
    return this == Environment.prod;
  }

  bool isStage() {
    return this == Environment.stage;
  }

  TResult ifIs<TResult>({
    required TResult Function() dev,
    required TResult Function() prod,
    required TResult Function() stage,
  }) {
    switch (this) {
      case Environment.dev:
        return dev();
      case Environment.prod:
        return prod();
      case Environment.stage:
        return stage();
    }
  }

  TResult maybeIfIs<TResult>({
    TResult Function()? dev,
    TResult Function()? prod,
    TResult Function()? stage,
    required TResult Function() orElse,
  }) {
    switch (this) {
      case Environment.dev:
        if (dev != null) return dev();
        break;
      case Environment.prod:
        if (prod != null) return prod();
        break;
      case Environment.stage:
        if (stage != null) return stage();
        break;
    }
    return orElse();
  }
}

```

## Settings

`GoodEnum` can be configured.

```dart
@GoodEnum(
  // disable/enable isIs method, default: true
  enableIf: true,
  // disable/enable maybeIfIs method, default: true
  enableMaybeIf: true,
  // customize prefix methods, default `iS`
  prefix: 'iS'
  valueCheckAsGetter:false,
)
...
```
