import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pagina_filtros_widget.dart' show PaginaFiltrosWidget;
import 'package:flutter/material.dart';

class PaginaFiltrosModel extends FlutterFlowModel<PaginaFiltrosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtMin widget.
  FocusNode? txtMinFocusNode;
  TextEditingController? txtMinController;
  String? Function(BuildContext, String?)? txtMinControllerValidator;
  // State field(s) for txtMax widget.
  FocusNode? txtMaxFocusNode;
  TextEditingController? txtMaxController;
  String? Function(BuildContext, String?)? txtMaxControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue3;
  FormFieldController<List<String>>? dropDownValueController3;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue4;
  FormFieldController<List<String>>? dropDownValueController4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtMinFocusNode?.dispose();
    txtMinController?.dispose();

    txtMaxFocusNode?.dispose();
    txtMaxController?.dispose();

    textFieldFocusNode1?.dispose();
    textController3?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();
  }
}
