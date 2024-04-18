import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_producto_clasificacion_widget.dart'
    show EditarProductoClasificacionWidget;
import 'package:flutter/material.dart';

class EditarProductoClasificacionModel
    extends FlutterFlowModel<EditarProductoClasificacionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ddCategoria widget.
  String? ddCategoriaValue;
  FormFieldController<String>? ddCategoriaValueController;
  // State field(s) for ddMarca widget.
  String? ddMarcaValue;
  FormFieldController<String>? ddMarcaValueController;
  // State field(s) for ddModelo widget.
  String? ddModeloValue;
  FormFieldController<String>? ddModeloValueController;
  // State field(s) for ddEstado widget.
  String? ddEstadoValue;
  FormFieldController<String>? ddEstadoValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
