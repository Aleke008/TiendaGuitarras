import '/flutter_flow/flutter_flow_util.dart';
import 'chat_mensajes_widget.dart' show ChatMensajesWidget;
import 'package:flutter/material.dart';

class ChatMensajesModel extends FlutterFlowModel<ChatMensajesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for inputMensajeEnviar widget.
  FocusNode? inputMensajeEnviarFocusNode;
  TextEditingController? inputMensajeEnviarController;
  String? Function(BuildContext, String?)?
      inputMensajeEnviarControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    inputMensajeEnviarFocusNode?.dispose();
    inputMensajeEnviarController?.dispose();
  }
}
