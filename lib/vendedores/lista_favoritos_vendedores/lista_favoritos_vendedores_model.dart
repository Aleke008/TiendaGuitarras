import '/flutter_flow/flutter_flow_util.dart';
import 'lista_favoritos_vendedores_widget.dart'
    show ListaFavoritosVendedoresWidget;
import 'package:flutter/material.dart';

class ListaFavoritosVendedoresModel
    extends FlutterFlowModel<ListaFavoritosVendedoresWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
