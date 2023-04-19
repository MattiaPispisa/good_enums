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
    print("AAA ${visitor.elements}");
    extensionBuffer.writeln('extension Good${visitor.className} on ${visitor.className} {');

    // compare methods
    final compareMethodPrefix = annotation.read('prefix').stringValue;

    for (final enumElement in visitor.elements) {
      extensionBuffer.writeln('bool $compareMethodPrefix${enumElement._capitalize()}() {');
      extensionBuffer.writeln('  return this == ${visitor.className}.$enumElement;');
      extensionBuffer.writeln('}');
    }

    // map method
    final canMap = annotation.read('enableMap').boolValue;
    if (canMap) {
      extensionBuffer.writeln('TResult map<TResult>({');
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
    final canMaybeMap = annotation.read('enableMaybeMap').boolValue;
    if (canMaybeMap) {
      extensionBuffer.writeln('TResult maybeMap<TResult>({');
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
