import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class EnumVisitor extends SimpleElementVisitor<dynamic> {
  String className = '';
  List<String> elements = [];

  @override
  dynamic visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();

    // DartType ends with '*', which needs to be eliminated
    // for the generated code to be accurate.
    className = elementReturnType.replaceFirst('*', '');
  }

  @override
  dynamic visitFieldElement(FieldElement element) {
    if (element.isEnumConstant) {
      elements.add(element.displayName);
    }
  }
}
