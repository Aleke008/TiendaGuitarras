import '/flutter_flow/flutter_flow_util.dart';
import 'chat_rooms_widget.dart' show ChatRoomsWidget;
import 'package:flutter/material.dart';

class ChatRoomsModel extends FlutterFlowModel<ChatRoomsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
