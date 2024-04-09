import '/flutter_flow/flutter_flow_util.dart';
import 'pagina_cerrar_widget.dart' show PaginaCerrarWidget;
import 'package:flutter/material.dart';

class PaginaCerrarModel extends FlutterFlowModel<PaginaCerrarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
