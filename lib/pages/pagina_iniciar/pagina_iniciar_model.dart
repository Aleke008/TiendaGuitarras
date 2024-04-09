import '/flutter_flow/flutter_flow_util.dart';
import 'pagina_iniciar_widget.dart' show PaginaIniciarWidget;
import 'package:flutter/material.dart';

class PaginaIniciarModel extends FlutterFlowModel<PaginaIniciarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
