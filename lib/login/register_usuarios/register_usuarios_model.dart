import '/flutter_flow/flutter_flow_util.dart';
import 'register_usuarios_widget.dart' show RegisterUsuariosWidget;
import 'package:flutter/material.dart';

class RegisterUsuariosModel extends FlutterFlowModel<RegisterUsuariosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtCorreo widget.
  FocusNode? txtCorreoFocusNode;
  TextEditingController? txtCorreoTextController;
  String? Function(BuildContext, String?)? txtCorreoTextControllerValidator;
  // State field(s) for txtContrasena widget.
  FocusNode? txtContrasenaFocusNode;
  TextEditingController? txtContrasenaTextController;
  late bool txtContrasenaVisibility;
  String? Function(BuildContext, String?)? txtContrasenaTextControllerValidator;
  // State field(s) for txtContrasena2 widget.
  FocusNode? txtContrasena2FocusNode;
  TextEditingController? txtContrasena2TextController;
  late bool txtContrasena2Visibility;
  String? Function(BuildContext, String?)?
      txtContrasena2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtContrasenaVisibility = false;
    txtContrasena2Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtCorreoFocusNode?.dispose();
    txtCorreoTextController?.dispose();

    txtContrasenaFocusNode?.dispose();
    txtContrasenaTextController?.dispose();

    txtContrasena2FocusNode?.dispose();
    txtContrasena2TextController?.dispose();
  }
}
