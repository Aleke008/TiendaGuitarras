import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'agregar_producto_widget.dart' show AgregarProductoWidget;
import 'package:flutter/material.dart';

class AgregarProductoModel extends FlutterFlowModel<AgregarProductoWidget> {
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
  // State field(s) for txtPrecioLista widget.
  FocusNode? txtPrecioListaFocusNode;
  TextEditingController? txtPrecioListaController;
  String? Function(BuildContext, String?)? txtPrecioListaControllerValidator;
  // State field(s) for ddOferta widget.
  bool? ddOfertaValue;
  FormFieldController<bool>? ddOfertaValueController;
  // State field(s) for txtPrecioOferta widget.
  FocusNode? txtPrecioOfertaFocusNode;
  TextEditingController? txtPrecioOfertaController;
  String? Function(BuildContext, String?)? txtPrecioOfertaControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNombreListaFocusNode?.dispose();
    txtNombreListaController?.dispose();

    txtDescripcionListaFocusNode?.dispose();
    txtDescripcionListaController?.dispose();

    txtPrecioListaFocusNode?.dispose();
    txtPrecioListaController?.dispose();

    txtPrecioOfertaFocusNode?.dispose();
    txtPrecioOfertaController?.dispose();
  }
}
