import '/flutter_flow/flutter_flow_util.dart';
import 'lista_favoritos_sin_productos_vendedor_widget.dart'
    show ListaFavoritosSinProductosVendedorWidget;
import 'package:flutter/material.dart';

class ListaFavoritosSinProductosVendedorModel
    extends FlutterFlowModel<ListaFavoritosSinProductosVendedorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
