import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pagina_calendario_fecha_max_widget.dart'
    show PaginaCalendarioFechaMaxWidget;
import 'package:flutter/material.dart';

class PaginaCalendarioFechaMaxModel
    extends FlutterFlowModel<PaginaCalendarioFechaMaxWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
