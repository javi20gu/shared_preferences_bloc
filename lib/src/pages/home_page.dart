import 'package:flutter/material.dart';
import 'package:preferencia_usuario/src/bloc/swich_bloc.dart';
import 'package:preferencia_usuario/src/bloc/theme_bloc.dart';
import 'package:preferencia_usuario/src/utils/utils.dart';

class HomePage extends StatelessWidget {
  final ThemeBloc bloc = ThemeBloc();
  final SwichtBloc swichtBloc = SwichtBloc();
  final SharedPrefered sharedPrefered = SharedPrefered();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder<bool>(
              initialData: sharedPrefered.getSwitch ?? false,
              stream: swichtBloc.valueSwicht,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: <Widget>[
                      snapshot.data == true
                          ? Icon(
                              Icons.settings_brightness,
                              size: 43,
                            )
                          : Icon(Icons.lightbulb_outline, size: 43),
                      Switch(
                        value: snapshot.data,
                        onChanged: (bool now) {
                          swichtBloc.cambiarOpcion(now);
                          if (now) {
                            bloc.cambiarTheme(new_theme: ThemeData.dark());
                          } else {
                            bloc.cambiarTheme(new_theme: ThemeData.light());
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
