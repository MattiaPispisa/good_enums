import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:good_enums/src/enum_visitor.dart';
import 'package:good_enums_annotations/good_enums_annotations.dart';
import 'package:source_gen/source_gen.dart';

/// {@template good_enums}
/// Good enum code generation
/// {@endtemplate}
class GoodEnumsGenerator extends GeneratorForAnnotation<GoodEnum> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = EnumVisitor();
    element.visitChildren(visitor);

    final extensionBuffer = StringBuffer();

    // start the extension
    extensionBuffer.writeln('extension Good${visitor.className} on ${visitor.className} {');

    // compare methods
    final methodsPrefix = annotation.read('prefix').stringValue;

    for (final enumElement in visitor.elements) {
      extensionBuffer.writeln('bool $methodsPrefix${enumElement._capitalize()}() {');
      extensionBuffer.writeln('  return this == ${visitor.className}.$enumElement;');
      extensionBuffer.writeln('}');
    }

    // map method
    final canIf = annotation.read('enableIf').boolValue;
    if (canIf) {
      extensionBuffer.writeln('TResult if${methodsPrefix._capitalize()}<TResult>({');
      for (final enumElement in visitor.elements) {
        extensionBuffer.writeln('required TResult Function() $enumElement,');
      }
      extensionBuffer.writeln('}) {');

      // enum switch
      extensionBuffer.writeln(' switch (this) {');
      for (final enumElement in visitor.elements) {
        extensionBuffer.writeln('   case ${visitor.className}.$enumElement:');
        extensionBuffer.writeln('   return ${enumElement}();');
      }
      extensionBuffer.writeln('   }');

      extensionBuffer.writeln(' }');
    }

    // maybe map method
    final canMaybeIf = annotation.read('enableMaybeIf').boolValue;
    if (canMaybeIf) {
      extensionBuffer.writeln('TResult maybeIf${methodsPrefix._capitalize()}<TResult>({');
      for (final enumElement in visitor.elements) {
        extensionBuffer.writeln('TResult Function()? $enumElement,');
      }
      extensionBuffer.writeln('required TResult Function() orElse,');
      extensionBuffer.writeln('}) {');

      // enum switch
      // start switch
      extensionBuffer.writeln(' switch (this) {');
      for (final enumElement in visitor.elements) {
        // case
        extensionBuffer.writeln('   case ${visitor.className}.$enumElement:');
        extensionBuffer.writeln('   if (${enumElement} != null) return ${enumElement}();');
        extensionBuffer.writeln('   break;');
      }
      // end switch
      extensionBuffer.writeln('   }');
      // fallback
      extensionBuffer.writeln('return orElse();');
      // end maybeMap
      extensionBuffer.writeln(' }');
    }

    // end the extension
    extensionBuffer.writeln('}');

    return extensionBuffer.toString();
  }
}

extension _StringExtension on String {
  String _capitalize() => "${this.isNotEmpty ? this[0].toUpperCase() : ''}${this.length > 1 ? this.substring(1) : ''}";
}
