import '/flutter_flow/flutter_flow_util.dart';
import 'lista_ventas_sin_informacion_widget.dart'
    show ListaVentasSinInformacionWidget;
import 'package:flutter/material.dart';

class ListaVentasSinInformacionModel
    extends FlutterFlowModel<ListaVentasSinInformacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
