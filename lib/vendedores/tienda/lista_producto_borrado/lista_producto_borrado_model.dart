import '/flutter_flow/flutter_flow_util.dart';
import 'lista_producto_borrado_widget.dart' show ListaProductoBorradoWidget;
import 'package:flutter/material.dart';

class ListaProductoBorradoModel
    extends FlutterFlowModel<ListaProductoBorradoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
