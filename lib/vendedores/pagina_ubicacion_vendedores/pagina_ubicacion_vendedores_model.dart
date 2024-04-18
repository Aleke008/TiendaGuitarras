import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pagina_ubicacion_vendedores_widget.dart'
    show PaginaUbicacionVendedoresWidget;
import 'package:flutter/material.dart';

class PaginaUbicacionVendedoresModel
    extends FlutterFlowModel<PaginaUbicacionVendedoresWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
