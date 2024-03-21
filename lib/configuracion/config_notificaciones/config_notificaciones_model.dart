import '/flutter_flow/flutter_flow_util.dart';
import 'config_notificaciones_widget.dart' show ConfigNotificacionesWidget;
import 'package:flutter/material.dart';

class ConfigNotificacionesModel
    extends FlutterFlowModel<ConfigNotificacionesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
