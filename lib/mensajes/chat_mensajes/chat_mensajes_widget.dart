import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mensajes/edit_post_message_popup/edit_post_message_popup_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_mensajes_model.dart';
export 'chat_mensajes_model.dart';

class ChatMensajesWidget extends StatefulWidget {
  const ChatMensajesWidget({
    super.key,
    String? chatRoomId,
    required this.usuarioChat,
    required this.receiverId,
  }) : chatRoomId = chatRoomId ?? 'nuevo';

  final String chatRoomId;
  final DocumentReference? usuarioChat;
  final String? receiverId;

  @override
  State<ChatMensajesWidget> createState() => _ChatMensajesWidgetState();
}

class _ChatMensajesWidgetState extends State<ChatMensajesWidget> {
  late ChatMensajesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMensajesModel());

    _model.inputMensajeEnviarTextController ??= TextEditingController();
    _model.inputMensajeEnviarFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.usuarioChat!),
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
        final chatMensajesUsersRecord = snapshot.data!;
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
                                        context.safePop();
                                      },
                                      text: '',
                                      icon: const Icon(
                                        Icons.clear,
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        chatMensajesUsersRecord
                                                        .alternatePhoto !=
                                                    ''
                                            ? chatMensajesUsersRecord
                                                .alternatePhoto
                                            : chatMensajesUsersRecord.photoUrl,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tienda-virtual-de-guitarras-vdm5bb/assets/9s29aii367py/SIN.jpg',
                                      ),
                                      width: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              functions.obtenerNombreUsuario(
                                                  chatMensajesUsersRecord
                                                      .email)!,
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: const Color(0xFFF2F2F2),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: chatMensajesUsersRecord
                                                          .estado ==
                                                      'En línea'
                                                  ? const Color(0xFFA3D5B2)
                                                  : const Color(0xFFFF1818),
                                              size: 24.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                chatMensajesUsersRecord.estado,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: const Color(0xFFF2F2F2),
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFD49ED2),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: StreamBuilder<List<MensajesRecord>>(
                            stream: queryMensajesRecord(
                              queryBuilder: (mensajesRecord) => mensajesRecord
                                  .where(
                                    'chatRoomId',
                                    isEqualTo: widget.chatRoomId,
                                  )
                                  .orderBy('created_time'),
                              limit: 255,
                            ),
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
                              List<MensajesRecord> listViewMensajesRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewMensajesRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewMensajesRecord =
                                      listViewMensajesRecordList[listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 16.0),
                                    child: Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF882E7F),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(15.0),
                                          bottomRight: const Radius.circular(15.0),
                                          topLeft: Radius.circular(
                                              valueOrDefault<double>(
                                            currentUserUid !=
                                                    listViewMensajesRecord
                                                        .senderId
                                                ? 0.0
                                                : 15.0,
                                            0.0,
                                          )),
                                          topRight: Radius.circular(
                                              valueOrDefault<double>(
                                            currentUserUid ==
                                                    listViewMensajesRecord
                                                        .senderId
                                                ? 0.0
                                                : 15.0,
                                            0.0,
                                          )),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 15.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      30.0),
                                                          child: Text(
                                                            listViewMensajesRecord
                                                                .mensaje,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: const Color(
                                                                      0xFFF2F2F2),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if ((currentUserUid ==
                                                                    listViewMensajesRecord
                                                                        .senderId) &&
                                                                (functions.calcularDifTiempoMsgEnviado(
                                                                        listViewMensajesRecord
                                                                            .createdTime) ==
                                                                    false))
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await listViewMensajesRecord
                                                                      .reference
                                                                      .delete();
                                                                },
                                                                child: const Icon(
                                                                  Icons
                                                                      .delete_sweep,
                                                                  color: Color(
                                                                      0xFFFF1818),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            if ((currentUserUid ==
                                                                    listViewMensajesRecord
                                                                        .senderId) &&
                                                                (functions.calcularDifTiempoMsgEnviado(
                                                                        listViewMensajesRecord
                                                                            .createdTime) ==
                                                                    false))
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: EditPostMessagePopupWidget(
                                                                                mensajesChatRef: listViewMensajesRecord.reference,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: const Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color: Color(
                                                                          0xFFD49ED2),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<String>(
                                                                dateTimeFormat(
                                                                    'd/M/y h:mm a',
                                                                    listViewMensajesRecord
                                                                        .createdTime),
                                                                'hace un momento',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: const Color(
                                                                        0xFFF2F2F2),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          if ((listViewMensajesRecord
                                                                      .estado ==
                                                                  false) &&
                                                              (currentUserUid ==
                                                                  listViewMensajesRecord
                                                                      .senderId))
                                                            const FaIcon(
                                                              FontAwesomeIcons
                                                                  .check,
                                                              color: Color(
                                                                  0xFFF2F2F2),
                                                              size: 24.0,
                                                            ),
                                                          if ((listViewMensajesRecord
                                                                      .estado ==
                                                                  true) &&
                                                              (currentUserUid ==
                                                                  listViewMensajesRecord
                                                                      .senderId))
                                                            const FaIcon(
                                                              FontAwesomeIcons
                                                                  .checkDouble,
                                                              color: Color(
                                                                  0xFFA3D5B2),
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    -5.0,
                                    4.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(25.0),
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model
                                          .inputMensajeEnviarTextController,
                                      focusNode:
                                          _model.inputMensajeEnviarFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFF0B0B0B),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Escribir mensaje....',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0xFF090909),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.multiline,
                                      validator: _model
                                          .inputMensajeEnviarTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await MensajesRecord.collection
                                          .doc()
                                          .set(createMensajesRecordData(
                                            createdTime: getCurrentTimestamp,
                                            mensaje: _model
                                                .inputMensajeEnviarTextController
                                                .text,
                                            estado: false,
                                            senderId: currentUserUid,
                                            senderEmail: currentUserEmail,
                                            receiverId: widget.receiverId,
                                            chatRoomId: widget.chatRoomId,
                                          ));
                                      setState(() {
                                        _model.inputMensajeEnviarTextController
                                            ?.clear();
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 56.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF882E7F),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(25.0),
                                                bottomRight:
                                                    Radius.circular(25.0),
                                                topLeft: Radius.circular(25.0),
                                                topRight: Radius.circular(25.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.send,
                                              color: Colors.white,
                                              size: 50.0,
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
                        ),
                      ],
                    ),
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
