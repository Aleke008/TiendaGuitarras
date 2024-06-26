import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const BuscarProductosWidget()
          : const LoginUsuariosWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const BuscarProductosWidget()
              : const LoginUsuariosWidget(),
        ),
        FFRoute(
          name: 'loginUsuarios',
          path: '/loginUsuarios',
          builder: (context, params) => const LoginUsuariosWidget(),
        ),
        FFRoute(
          name: 'registerUsuarios',
          path: '/registerUsuarios',
          builder: (context, params) => const RegisterUsuariosWidget(),
        ),
        FFRoute(
          name: 'buscarProductos',
          path: '/buscarProductos',
          builder: (context, params) => const BuscarProductosWidget(),
        ),
        FFRoute(
          name: 'paginaFiltros',
          path: '/paginaFiltros',
          builder: (context, params) => const PaginaFiltrosWidget(),
        ),
        FFRoute(
          name: 'paginaUbicacionVendedores',
          path: '/paginaUbicacionVendedores',
          builder: (context, params) => const PaginaUbicacionVendedoresWidget(),
        ),
        FFRoute(
          name: 'paginaVendedoresBusqueda',
          path: '/paginaVendedoresBusqueda',
          builder: (context, params) => const PaginaVendedoresBusquedaWidget(),
        ),
        FFRoute(
          name: 'paginaFiltrosVendedor',
          path: '/paginaFiltrosVendedor',
          builder: (context, params) => const PaginaFiltrosVendedorWidget(),
        ),
        FFRoute(
          name: 'paginaInformacionVendedor',
          path: '/paginaInformacionVendedor',
          builder: (context, params) => PaginaInformacionVendedorWidget(
            refUsuario: params.getParam(
              'refUsuario',
              ParamType.DocumentReference,
              false,
              ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'paginaProductoDetalles',
          path: '/paginaProductoDetalles',
          builder: (context, params) => PaginaProductoDetallesWidget(
            refProducto: params.getParam(
              'refProducto',
              ParamType.DocumentReference,
              false,
              ['listas', 'productos2'],
            ),
          ),
        ),
        FFRoute(
          name: 'miPerfil',
          path: '/miPerfil',
          builder: (context, params) => const MiPerfilWidget(),
        ),
        FFRoute(
          name: 'paginaIniciar',
          path: '/paginaIniciar',
          builder: (context, params) => const PaginaIniciarWidget(),
        ),
        FFRoute(
          name: 'configInterfaz',
          path: '/configInterfaz',
          builder: (context, params) => const ConfigInterfazWidget(),
        ),
        FFRoute(
          name: 'configNotificaciones',
          path: '/configNotificaciones',
          builder: (context, params) => const ConfigNotificacionesWidget(),
        ),
        FFRoute(
          name: 'registroVendedor',
          path: '/registroVendedor',
          builder: (context, params) => const RegistroVendedorWidget(),
        ),
        FFRoute(
          name: 'creacionVentasSinInformacion',
          path: '/creacionVentasSinInformacion',
          builder: (context, params) => const CreacionVentasSinInformacionWidget(),
        ),
        FFRoute(
          name: 'listaVentasConInformacion',
          path: '/listaVentasConInformacion',
          builder: (context, params) => const ListaVentasConInformacionWidget(),
        ),
        FFRoute(
          name: 'edicionVentasSinInformacion',
          path: '/edicionVentasSinInformacion',
          asyncParams: {
            'lista': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => EdicionVentasSinInformacionWidget(
            lista: params.getParam(
              'lista',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'agregarProducto',
          path: '/agregarProducto',
          asyncParams: {
            'refAg': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => AgregarProductoWidget(
            refAg: params.getParam(
              'refAg',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'editarProducto',
          path: '/editarProducto',
          asyncParams: {
            'refLista': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => EditarProductoWidget(
            refProducto: params.getParam(
              'refProducto',
              ParamType.DocumentReference,
              false,
              ['listas', 'productos2'],
            ),
            refLista: params.getParam(
              'refLista',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'listaProductosAgregados',
          path: '/listaProductosAgregados',
          asyncParams: {
            'listas': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => ListaProductosAgregadosWidget(
            listas: params.getParam(
              'listas',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'configAplicacion',
          path: '/configAplicacion',
          builder: (context, params) => const ConfigAplicacionWidget(),
        ),
        FFRoute(
          name: 'chatMensajes',
          path: '/chatMensajes',
          builder: (context, params) => ChatMensajesWidget(
            chatRoomId: params.getParam(
              'chatRoomId',
              ParamType.String,
            ),
            usuarioChat: params.getParam(
              'usuarioChat',
              ParamType.DocumentReference,
              false,
              ['users'],
            ),
            receiverId: params.getParam(
              'receiverId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'chatRooms',
          path: '/chatRooms',
          builder: (context, params) => const ChatRoomsWidget(),
        ),
        FFRoute(
          name: 'mensajeSinInformacion',
          path: '/mensajeSinInformacion',
          builder: (context, params) => const MensajeSinInformacionWidget(),
        ),
        FFRoute(
          name: 'listaFavoritosProductos',
          path: '/listaFavoritosProductos',
          builder: (context, params) => const ListaFavoritosProductosWidget(),
        ),
        FFRoute(
          name: 'listaFavoritosVendedores',
          path: '/listaFavoritosVendedores',
          builder: (context, params) => const ListaFavoritosVendedoresWidget(),
        ),
        FFRoute(
          name: 'agregarProductoClasificacion',
          path: '/agregarProductoClasificacion',
          asyncParams: {
            'refClas': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => AgregarProductoClasificacionWidget(
            refClas: params.getParam(
              'refClas',
              ParamType.Document,
            ),
            nombre: params.getParam(
              'nombre',
              ParamType.String,
            ),
            descripcion: params.getParam(
              'descripcion',
              ParamType.String,
            ),
            precio: params.getParam(
              'precio',
              ParamType.double,
            ),
            esOferta: params.getParam(
              'esOferta',
              ParamType.bool,
            ),
            precioOferta: params.getParam(
              'precioOferta',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'agregarProductosImagenes',
          path: '/agregarProductosImagenes',
          asyncParams: {
            'ref': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => AgregarProductosImagenesWidget(
            ref: params.getParam(
              'ref',
              ParamType.Document,
            ),
            nombre: params.getParam(
              'nombre',
              ParamType.String,
            ),
            descripcion: params.getParam(
              'descripcion',
              ParamType.String,
            ),
            precio: params.getParam(
              'precio',
              ParamType.double,
            ),
            esOferta: params.getParam(
              'esOferta',
              ParamType.bool,
            ),
            precioOferta: params.getParam(
              'precioOferta',
              ParamType.double,
            ),
            categoria: params.getParam(
              'categoria',
              ParamType.String,
            ),
            marca: params.getParam(
              'marca',
              ParamType.String,
            ),
            modelo: params.getParam(
              'modelo',
              ParamType.String,
            ),
            estado: params.getParam(
              'estado',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'editarProductoClasificacion',
          path: '/editarProductoClasificacion',
          asyncParams: {
            'refLista': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => EditarProductoClasificacionWidget(
            refClas: params.getParam(
              'refClas',
              ParamType.DocumentReference,
              false,
              ['listas', 'productos2'],
            ),
            nombre: params.getParam(
              'nombre',
              ParamType.String,
            ),
            descripcion: params.getParam(
              'descripcion',
              ParamType.String,
            ),
            precio: params.getParam(
              'precio',
              ParamType.double,
            ),
            esOferta: params.getParam(
              'esOferta',
              ParamType.bool,
            ),
            precioOferta: params.getParam(
              'precioOferta',
              ParamType.double,
            ),
            enVenta: params.getParam(
              'enVenta',
              ParamType.bool,
            ),
            refLista: params.getParam(
              'refLista',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'editarProductosImagenes',
          path: '/editarProductosImagenes',
          asyncParams: {
            'refLista': getDoc(['listas'], ListasRecord.fromSnapshot),
          },
          builder: (context, params) => EditarProductosImagenesWidget(
            refClas: params.getParam(
              'refClas',
              ParamType.DocumentReference,
              false,
              ['listas', 'productos2'],
            ),
            nombre: params.getParam(
              'nombre',
              ParamType.String,
            ),
            descripcion: params.getParam(
              'descripcion',
              ParamType.String,
            ),
            precio: params.getParam(
              'precio',
              ParamType.double,
            ),
            esOferta: params.getParam(
              'esOferta',
              ParamType.bool,
            ),
            precioOferta: params.getParam(
              'precioOferta',
              ParamType.double,
            ),
            categoria: params.getParam(
              'categoria',
              ParamType.String,
            ),
            marca: params.getParam(
              'marca',
              ParamType.String,
            ),
            modelo: params.getParam(
              'modelo',
              ParamType.String,
            ),
            estado: params.getParam(
              'estado',
              ParamType.String,
            ),
            enVenta: params.getParam(
              'enVenta',
              ParamType.bool,
            ),
            refLista: params.getParam(
              'refLista',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'miPerfilVendedor',
          path: '/miPerfilVendedor',
          builder: (context, params) => const MiPerfilVendedorWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginUsuarios';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
