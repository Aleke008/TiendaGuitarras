import '/flutter_flow/flutter_flow_util.dart';
import 'pagina_producto_detalles_widget.dart' show PaginaProductoDetallesWidget;
import 'package:flutter/material.dart';

class PaginaProductoDetallesModel
    extends FlutterFlowModel<PaginaProductoDetallesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
