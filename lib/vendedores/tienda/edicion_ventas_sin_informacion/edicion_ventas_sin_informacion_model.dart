import '/flutter_flow/flutter_flow_util.dart';
import 'edicion_ventas_sin_informacion_widget.dart'
    show EdicionVentasSinInformacionWidget;
import 'package:flutter/material.dart';

class EdicionVentasSinInformacionModel
    extends FlutterFlowModel<EdicionVentasSinInformacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNombreLista widget.
  FocusNode? txtNombreListaFocusNode;
  TextEditingController? txtNombreListaController;
  String? Function(BuildContext, String?)? txtNombreListaControllerValidator;
  // State field(s) for txtDescripcionLista widget.
  FocusNode? txtDescripcionListaFocusNode;
  TextEditingController? txtDescripcionListaController;
  String? Function(BuildContext, String?)?
      txtDescripcionListaControllerValidator;
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
    txtNombreListaController?.dispose();

    txtDescripcionListaFocusNode?.dispose();
    txtDescripcionListaController?.dispose();
  }
}
