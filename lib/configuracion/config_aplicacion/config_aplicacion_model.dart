import '/flutter_flow/flutter_flow_util.dart';
import 'config_aplicacion_widget.dart' show ConfigAplicacionWidget;
import 'package:flutter/material.dart';

class ConfigAplicacionModel extends FlutterFlowModel<ConfigAplicacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
