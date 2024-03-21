import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'agregar_producto_widget.dart' show AgregarProductoWidget;
import 'package:flutter/material.dart';

class AgregarProductoModel extends FlutterFlowModel<AgregarProductoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNombreLista widget.
  FocusNode? txtNombreListaFocusNode1;
  TextEditingController? txtNombreListaController1;
  String? Function(BuildContext, String?)? txtNombreListaController1Validator;
  // State field(s) for txtDescripcionLista widget.
  FocusNode? txtDescripcionListaFocusNode;
  TextEditingController? txtDescripcionListaController;
  String? Function(BuildContext, String?)?
      txtDescripcionListaControllerValidator;
  // State field(s) for txtPrecioLista widget.
  FocusNode? txtPrecioListaFocusNode;
  TextEditingController? txtPrecioListaController;
  String? Function(BuildContext, String?)? txtPrecioListaControllerValidator;
  // State field(s) for txtNombreLista widget.
  String? txtNombreListaValue;
  FormFieldController<String>? txtNombreListaValueController;
  // State field(s) for txtNombreLista widget.
  FocusNode? txtNombreListaFocusNode2;
  TextEditingController? txtNombreListaController2;
  String? Function(BuildContext, String?)? txtNombreListaController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNombreListaFocusNode1?.dispose();
    txtNombreListaController1?.dispose();

    txtDescripcionListaFocusNode?.dispose();
    txtDescripcionListaController?.dispose();

    txtPrecioListaFocusNode?.dispose();
    txtPrecioListaController?.dispose();

    txtNombreListaFocusNode2?.dispose();
    txtNombreListaController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
