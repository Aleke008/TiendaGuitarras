import '/flutter_flow/flutter_flow_util.dart';
import 'lista_ventas_con_informacion_widget.dart'
    show ListaVentasConInformacionWidget;
import 'package:flutter/material.dart';

class ListaVentasConInformacionModel
    extends FlutterFlowModel<ListaVentasConInformacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
