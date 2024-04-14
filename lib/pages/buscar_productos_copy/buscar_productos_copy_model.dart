import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'buscar_productos_copy_widget.dart' show BuscarProductosCopyWidget;
import 'package:flutter/material.dart';

class BuscarProductosCopyModel
    extends FlutterFlowModel<BuscarProductosCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<ProductosRecord> simpleSearchResults = [];
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
