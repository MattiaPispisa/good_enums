// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// GoodEnumsGenerator
// **************************************************************************

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

  TResult map<TResult>({
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

  TResult maybeMap<TResult>({
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

extension GoodEnvironmentLessGood on EnvironmentLessGood {
  bool isDev() {
    return this == EnvironmentLessGood.dev;
  }

  bool isProd() {
    return this == EnvironmentLessGood.prod;
  }

  bool isStage() {
    return this == EnvironmentLessGood.stage;
  }

  TResult maybeMap<TResult>({
    TResult Function()? dev,
    TResult Function()? prod,
    TResult Function()? stage,
    required TResult Function() orElse,
  }) {
    switch (this) {
      case EnvironmentLessGood.dev:
        if (dev != null) return dev();
        break;
      case EnvironmentLessGood.prod:
        if (prod != null) return prod();
        break;
      case EnvironmentLessGood.stage:
        if (stage != null) return stage();
        break;
    }
    return orElse();
  }
}

extension GoodEnvironmentLessLessGood on EnvironmentLessLessGood {
  bool isDev() {
    return this == EnvironmentLessLessGood.dev;
  }

  bool isProd() {
    return this == EnvironmentLessLessGood.prod;
  }

  bool isStage() {
    return this == EnvironmentLessLessGood.stage;
  }
}

extension GoodSpecialEnvironment on SpecialEnvironment {
  bool wowASpecialMethodDev() {
    return this == SpecialEnvironment.dev;
  }

  bool wowASpecialMethodProd() {
    return this == SpecialEnvironment.prod;
  }

  bool wowASpecialMethodStage() {
    return this == SpecialEnvironment.stage;
  }
}
