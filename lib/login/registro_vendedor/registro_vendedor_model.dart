import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registro_vendedor_widget.dart' show RegistroVendedorWidget;
import 'package:flutter/material.dart';

class RegistroVendedorModel extends FlutterFlowModel<RegistroVendedorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ddProvincia widget.
  String? ddProvinciaValue;
  FormFieldController<String>? ddProvinciaValueController;
  // State field(s) for ddCanton widget.
  String? ddCantonValue;
  FormFieldController<String>? ddCantonValueController;
  // State field(s) for ddDistrito widget.
  String? ddDistritoValue;
  FormFieldController<String>? ddDistritoValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
