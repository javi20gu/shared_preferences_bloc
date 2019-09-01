import 'dart:async';
import 'package:flutter/material.dart';

class ThemeBloc {
  static final ThemeBloc _singleton = ThemeBloc._();

  ThemeBloc._();
  factory ThemeBloc() => _singleton;

  StreamController _streamController = StreamController<ThemeData>.broadcast();

  Stream<ThemeData> get getNowTheme => _streamController.stream;

  cambiarTheme({@required ThemeData new_theme}) {
    _streamController.sink.add(new_theme);
  }

  dispose() {
    return _streamController?.close();
  }
}
