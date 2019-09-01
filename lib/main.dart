import 'package:flutter/material.dart';
import 'package:preferencia_usuario/src/bloc/theme_bloc.dart';
import 'package:preferencia_usuario/src/pages/home_page.dart';
import 'package:preferencia_usuario/src/utils/utils.dart';

void main() async {  
  final SharedPrefered sharedPrefered = SharedPrefered();
  await sharedPrefered.initDb();
  if(sharedPrefered.getSwitch == null) {
    sharedPrefered.setSwitch = false;
  }
  runApp(App());
} 

class App extends StatelessWidget {
  final ThemeBloc bloc = ThemeBloc();
  final SharedPrefered sharedPrefered = SharedPrefered();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.getNowTheme,
        initialData: sharedPrefered.getSwitch ? ThemeData.dark() : ThemeData.light(),
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: "Shared User",
              home: HomePage(),
              theme: snapshot.data,
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
