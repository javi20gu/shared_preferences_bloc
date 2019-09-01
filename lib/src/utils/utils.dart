import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefered {

  static final SharedPrefered _singleton = SharedPrefered._();

  SharedPrefered._();

  factory SharedPrefered() {
    return _singleton;
  } 

  SharedPreferences _pref;

  bool get getSwitch => _pref.getBool("switch");

  set setSwitch(bool new_switch) {
    _pref.setBool("switch", new_switch);
  }

  initDb() async {
    _pref = await SharedPreferences.getInstance();
  }

}
