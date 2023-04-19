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
}
