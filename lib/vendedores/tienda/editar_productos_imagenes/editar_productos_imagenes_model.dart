import '/flutter_flow/flutter_flow_util.dart';
import 'editar_productos_imagenes_widget.dart'
    show EditarProductosImagenesWidget;
import 'package:flutter/material.dart';

class EditarProductosImagenesModel
    extends FlutterFlowModel<EditarProductosImagenesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
