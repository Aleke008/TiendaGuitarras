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
  TextEditingController? txtBuscadorController;
  String? Function(BuildContext, String?)? txtBuscadorControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtBuscadorFocusNode?.dispose();
    txtBuscadorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
