import '/flutter_flow/flutter_flow_util.dart';
import 'register_usuarios_widget.dart' show RegisterUsuariosWidget;
import 'package:flutter/material.dart';

class RegisterUsuariosModel extends FlutterFlowModel<RegisterUsuariosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtCorreo widget.
  FocusNode? txtCorreoFocusNode;
  TextEditingController? txtCorreoController;
  String? Function(BuildContext, String?)? txtCorreoControllerValidator;
  // State field(s) for txtContrasena widget.
  FocusNode? txtContrasenaFocusNode;
  TextEditingController? txtContrasenaController;
  late bool txtContrasenaVisibility;
  String? Function(BuildContext, String?)? txtContrasenaControllerValidator;
  // State field(s) for txtContrasena2 widget.
  FocusNode? txtContrasena2FocusNode;
  TextEditingController? txtContrasena2Controller;
  late bool txtContrasena2Visibility;
  String? Function(BuildContext, String?)? txtContrasena2ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    txtContrasenaVisibility = false;
    txtContrasena2Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtCorreoFocusNode?.dispose();
    txtCorreoController?.dispose();

    txtContrasenaFocusNode?.dispose();
    txtContrasenaController?.dispose();

    txtContrasena2FocusNode?.dispose();
    txtContrasena2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
