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
  TextEditingController? txtNombreListaController;
  String? Function(BuildContext, String?)? txtNombreListaControllerValidator;
  // State field(s) for txtDescripcionLista widget.
  FocusNode? txtDescripcionListaFocusNode;
  TextEditingController? txtDescripcionListaController;
  String? Function(BuildContext, String?)?
      txtDescripcionListaControllerValidator;

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
