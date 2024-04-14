import '/flutter_flow/flutter_flow_util.dart';
import 'agregar_productos_imagenes_widget.dart'
    show AgregarProductosImagenesWidget;
import 'package:flutter/material.dart';

class AgregarProductosImagenesModel
    extends FlutterFlowModel<AgregarProductosImagenesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
