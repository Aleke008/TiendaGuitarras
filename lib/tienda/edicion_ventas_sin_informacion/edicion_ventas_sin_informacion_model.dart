import '/flutter_flow/flutter_flow_util.dart';
import 'edicion_ventas_sin_informacion_widget.dart'
    show EdicionVentasSinInformacionWidget;
import 'package:flutter/material.dart';

class EdicionVentasSinInformacionModel
    extends FlutterFlowModel<EdicionVentasSinInformacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNombreLista widget.
  FocusNode? txtNombreListaFocusNode1;
  TextEditingController? txtNombreListaController1;
  String? Function(BuildContext, String?)? txtNombreListaController1Validator;
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

    txtNombreListaFocusNode2?.dispose();
    txtNombreListaController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
