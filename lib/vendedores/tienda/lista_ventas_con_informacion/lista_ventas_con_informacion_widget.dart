import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'lista_ventas_con_informacion_model.dart';
export 'lista_ventas_con_informacion_model.dart';

class ListaVentasConInformacionWidget extends StatefulWidget {
  const ListaVentasConInformacionWidget({super.key});

  @override
  State<ListaVentasConInformacionWidget> createState() =>
      _ListaVentasConInformacionWidgetState();
}

class _ListaVentasConInformacionWidgetState
    extends State<ListaVentasConInformacionWidget> {
  late ListaVentasConInformacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaVentasConInformacionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<Productos2Record>>(
      stream: queryProductos2Record(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFFF3F3F3),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<Productos2Record> listaVentasConInformacionProductos2RecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFF3F3F3),
            drawer: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Drawer(
                elevation: 30.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: const Icon(
                                Icons.close,
                                color: Color(0xFF882E7F),
                                size: 45.0,
                              ),
                              onPressed: () async {
                                if (scaffoldKey.currentState!.isDrawerOpen ||
                                    scaffoldKey.currentState!.isEndDrawerOpen) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  80.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('buscarProductos');
                            },
                            child: ListTile(
                              leading: const FaIcon(
                                FontAwesomeIcons.home,
                                color: Color(0xFF882E7F),
                                size: 30.0,
                              ),
                              title: Text(
                                'Inicio',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 26.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              tileColor: const Color(0x00FFFFFF),
                              dense: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ListTile(
                            leading: const FaIcon(
                              FontAwesomeIcons.solidUser,
                              color: Color(0xFF882E7F),
                              size: 30.0,
                            ),
                            title: Text(
                              'Mi perfil',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: const Color(0x00FFFFFF),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ListTile(
                            leading: const FaIcon(
                              FontAwesomeIcons.guitar,
                              color: Color(0xFF882E7F),
                              size: 30.0,
                            ),
                            title: Text(
                              'Vender productos',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: const Color(0x00FFFFFF),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.favorite,
                              color: Color(0xFF882E7F),
                              size: 30.0,
                            ),
                            title: Text(
                              'Lista Favoritos',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: const Color(0x00FFFFFF),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.chat_bubble_outline,
                              color: Color(0xFF882E7F),
                              size: 30.0,
                            ),
                            title: Text(
                              'Mensajes',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: const Color(0x00FFFFFF),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.settings_sharp,
                              color: Color(0xFF882E7F),
                              size: 30.0,
                            ),
                            title: Text(
                              'Configuración',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: const Color(0x00FFFFFF),
                            dense: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.logout_outlined,
                              color: Color(0xFF882E7F),
                              size: 30.0,
                            ),
                            title: Text(
                              'Cerrar Sesión',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            tileColor: const Color(0x00FFFFFF),
                            dense: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: MediaQuery.sizeOf(context).height * 0.09,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD49ED2),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('buscarProductos');
                                      },
                                      text: '',
                                      icon: const Icon(
                                        Icons.keyboard_return,
                                        color: Color(0xFF882E7F),
                                        size: 50.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0x004B39EF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mis listas de ventas',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF3F3F3),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 230.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize:
                                          MediaQuery.sizeOf(context).width *
                                              1.0,
                                      fillColor: const Color(0xFFF3F3F3),
                                      icon: const Icon(
                                        Icons.storefront_sharp,
                                        color: Color(0xFFD49ED2),
                                        size: 50.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                            'creacionVentasSinInformacion');
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      150.0, 25.0, 80.0, 0.0),
                                  child: Text(
                                    'AGREGAR NUEVA LISTA DE VENTA',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: const Color(0xFFD49ED2),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<ListasRecord>>(
                    stream: queryListasRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ListasRecord> listViewListasRecordList =
                          snapshot.data!;
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewListasRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewListasRecord =
                              listViewListasRecordList[listViewIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.16,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: const Color(0xFFD49ED2),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'listaProductosAgregados',
                                              queryParameters: {
                                                'listas': serializeParam(
                                                  listViewListasRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'listas': listViewListasRecord,
                                              },
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              listViewListasRecord.imagen,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  310.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: const FaIcon(
                                              FontAwesomeIcons.pen,
                                              color: Color(0xFF882E7F),
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                'edicionVentasSinInformacion',
                                                queryParameters: {
                                                  'lista': serializeParam(
                                                    listViewListasRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'lista': listViewListasRecord,
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  150.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            listViewListasRecord.nombre,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  145.0, 35.0, 0.0, 0.0),
                                          child: Text(
                                            'Cantidad de productos:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  110.0, 0.0, 0.0, 0.0),
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              setState(() =>
                                                  FFAppState().estadoLike =
                                                      !FFAppState().estadoLike);
                                            },
                                            value: FFAppState().estadoLike,
                                            onIcon: const Icon(
                                              Icons.favorite_border,
                                              color: Color(0xFFEF394D),
                                              size: 25.0,
                                            ),
                                            offIcon: const Icon(
                                              Icons.favorite,
                                              color: Color(0xFFEF394D),
                                              size: 25.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  125.0, 35.0, 210.0, 0.0),
                                          child: Text(
                                            '#',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  150.0, 52.0, 180.0, 0.0),
                                          child: Text(
                                            '#',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  150.0, 70.0, 160.0, 0.0),
                                          child: Text(
                                            '#.##',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  170.0, 55.0, 0.0, 0.0),
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              setState(() =>
                                                  FFAppState().estadoLike =
                                                      !FFAppState().estadoLike);
                                            },
                                            value: FFAppState().estadoLike,
                                            onIcon: const Icon(
                                              Icons.star_border,
                                              color: Color(0xFFEBEF39),
                                              size: 25.0,
                                            ),
                                            offIcon: const Icon(
                                              Icons.star,
                                              color: Color(0xFFEBEF39),
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  220.0, 55.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context
                                                  .pushNamed('agregarProducto');
                                            },
                                            text: 'Producto',
                                            icon: const Icon(
                                              Icons.add_circle_outline,
                                              color: Color(0xFF882E7F),
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.3,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.032,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: const Color(0xFF882E7F),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  145.0, 90.0, 0.0, 0.0),
                                          child: Text(
                                            'Calificación',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  218.0, 85.0, 8.0, 0.0),
                                          child: Text(
                                            'Fecha de creación',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  240.0, 105.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'd/M/y',
                                                  listViewListasRecord
                                                      .fechaCreacion),
                                              '00/00/00',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
