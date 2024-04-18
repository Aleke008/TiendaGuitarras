import '/flutter_flow/flutter_flow_util.dart';
import 'creacion_ventas_sin_informacion_widget.dart'
    show CreacionVentasSinInformacionWidget;
import 'package:flutter/material.dart';

class CreacionVentasSinInformacionModel
    extends FlutterFlowModel<CreacionVentasSinInformacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNombreLista widget.
  FocusNode? txtNombreListaFocusNode;
  TextEditingController? txtNombreListaTextController;
  String? Function(BuildContext, String?)?
      txtNombreListaTextControllerValidator;
  // State field(s) for txtDescripcionLista widget.
  FocusNode? txtDescripcionListaFocusNode;
  TextEditingController? txtDescripcionListaTextController;
  String? Function(BuildContext, String?)?
      txtDescripcionListaTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNombreListaFocusNode?.dispose();
    txtNombreListaTextController?.dispose();

    txtDescripcionListaFocusNode?.dispose();
    txtDescripcionListaTextController?.dispose();
  }
}
