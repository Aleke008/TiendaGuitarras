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
  // State field(s) for btnContrasena2 widget.
  FocusNode? btnContrasena2FocusNode;
  TextEditingController? btnContrasena2Controller;
  late bool btnContrasena2Visibility;
  String? Function(BuildContext, String?)? btnContrasena2ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    txtContrasenaVisibility = false;
    btnContrasena2Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtCorreoFocusNode?.dispose();
    txtCorreoController?.dispose();

    txtContrasenaFocusNode?.dispose();
    txtContrasenaController?.dispose();

    btnContrasena2FocusNode?.dispose();
    btnContrasena2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
