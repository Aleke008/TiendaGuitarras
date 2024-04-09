import '/flutter_flow/flutter_flow_util.dart';
import 'buscar_productos_widget.dart' show BuscarProductosWidget;
import 'package:flutter/material.dart';

class BuscarProductosModel extends FlutterFlowModel<BuscarProductosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtBuscador widget.
  FocusNode? txtBuscadorFocusNode;
  TextEditingController? txtBuscadorController;
  String? Function(BuildContext, String?)? txtBuscadorControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtBuscadorFocusNode?.dispose();
    txtBuscadorController?.dispose();
  }
}
