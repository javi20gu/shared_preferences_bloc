import 'dart:async';
import 'package:preferencia_usuario/src/utils/utils.dart';
import 'package:preferencia_usuario/src/bloc/theme_bloc.dart';

class SwichtBloc {
  static final SwichtBloc _singleton = SwichtBloc._();
  final ThemeBloc themeBloc = ThemeBloc();
  SwichtBloc._();

  factory SwichtBloc() => _singleton;

  StreamController<bool> _streamController = StreamController();

  Stream<bool> get valueSwicht => _streamController.stream;

  cambiarOpcion(bool estadoActual) async {
    final SharedPrefered sharedPrefered = SharedPrefered();
    sharedPrefered.setSwitch = estadoActual;
    _streamController.sink.add(estadoActual);
  }

  dispose() {
    _streamController?.close();
  }
}
