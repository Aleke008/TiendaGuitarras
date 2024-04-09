import '/flutter_flow/flutter_flow_util.dart';
import 'lista_productos_agregados_widget.dart'
    show ListaProductosAgregadosWidget;
import 'package:flutter/material.dart';

class ListaProductosAgregadosModel
    extends FlutterFlowModel<ListaProductosAgregadosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
