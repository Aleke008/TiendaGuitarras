import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _estadoLike = prefs.getBool('ff_estadoLike') ?? _estadoLike;
    });
    _safeInit(() {
      _integer = prefs.getInt('ff_integer') ?? _integer;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _estadoLike = false;
  bool get estadoLike => _estadoLike;
  set estadoLike(bool value) {
    _estadoLike = value;
    prefs.setBool('ff_estadoLike', value);
  }

  int _integer = 0;
  int get integer => _integer;
  set integer(int value) {
    _integer = value;
    prefs.setInt('ff_integer', value);
  }

  bool _MostrarListaCompleta = true;
  bool get MostrarListaCompleta => _MostrarListaCompleta;
  set MostrarListaCompleta(bool value) {
    _MostrarListaCompleta = value;
  }

  String _direccionVendedor = '';
  String get direccionVendedor => _direccionVendedor;
  set direccionVendedor(String value) {
    _direccionVendedor = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
