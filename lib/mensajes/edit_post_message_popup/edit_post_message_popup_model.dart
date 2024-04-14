import '/flutter_flow/flutter_flow_util.dart';
import 'edit_post_message_popup_widget.dart' show EditPostMessagePopupWidget;
import 'package:flutter/material.dart';

class EditPostMessagePopupModel
    extends FlutterFlowModel<EditPostMessagePopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputMessageEditPost widget.
  FocusNode? inputMessageEditPostFocusNode;
  TextEditingController? inputMessageEditPostController;
  String? Function(BuildContext, String?)?
      inputMessageEditPostControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputMessageEditPostFocusNode?.dispose();
    inputMessageEditPostController?.dispose();
  }
}
