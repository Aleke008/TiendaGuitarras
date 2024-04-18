import '/flutter_flow/flutter_flow_util.dart';
import 'mi_perfil_widget.dart' show MiPerfilWidget;
import 'package:flutter/material.dart';

class MiPerfilModel extends FlutterFlowModel<MiPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
