import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_producto_widget.dart' show EditarProductoWidget;
import 'package:flutter/material.dart';

class EditarProductoModel extends FlutterFlowModel<EditarProductoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
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
  // State field(s) for txtPausaVenta widget.
  bool? txtPausaVentaValue;
  FormFieldController<bool>? txtPausaVentaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();

    txtDescripcionListaFocusNode?.dispose();
    txtDescripcionListaTextController?.dispose();

    txtPrecioListaFocusNode?.dispose();
    txtPrecioListaTextController?.dispose();

    txtPrecioOfertaFocusNode?.dispose();
    txtPrecioOfertaTextController?.dispose();
  }
}
