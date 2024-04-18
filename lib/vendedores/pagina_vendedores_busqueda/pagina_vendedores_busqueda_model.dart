import '/flutter_flow/flutter_flow_util.dart';
import 'pagina_vendedores_busqueda_widget.dart'
    show PaginaVendedoresBusquedaWidget;
import 'package:flutter/material.dart';

class PaginaVendedoresBusquedaModel
    extends FlutterFlowModel<PaginaVendedoresBusquedaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtBuscador widget.
  FocusNode? txtBuscadorFocusNode;
  TextEditingController? txtBuscadorTextController;
  String? Function(BuildContext, String?)? txtBuscadorTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtBuscadorFocusNode?.dispose();
    txtBuscadorTextController?.dispose();
  }
}
