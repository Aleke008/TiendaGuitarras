import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'agregar_producto_widget.dart' show AgregarProductoWidget;
import 'package:flutter/material.dart';

class AgregarProductoModel extends FlutterFlowModel<AgregarProductoWidget> {
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
  // State field(s) for txtPrecioLista widget.
  FocusNode? txtPrecioListaFocusNode;
  TextEditingController? txtPrecioListaTextController;
  String? Function(BuildContext, String?)?
      txtPrecioListaTextControllerValidator;
  // State field(s) for ddOferta widget.
  bool? ddOfertaValue;
  FormFieldController<bool>? ddOfertaValueController;
  // State field(s) for txtPrecioOferta widget.
  FocusNode? txtPrecioOfertaFocusNode;
  TextEditingController? txtPrecioOfertaTextController;
  String? Function(BuildContext, String?)?
      txtPrecioOfertaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNombreListaFocusNode?.dispose();
    txtNombreListaTextController?.dispose();

    txtDescripcionListaFocusNode?.dispose();
    txtDescripcionListaTextController?.dispose();

    txtPrecioListaFocusNode?.dispose();
    txtPrecioListaTextController?.dispose();

    txtPrecioOfertaFocusNode?.dispose();
    txtPrecioOfertaTextController?.dispose();
  }
}
