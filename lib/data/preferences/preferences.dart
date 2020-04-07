import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences _prefs;

  //constructor
  Preferences() {
    initPrefs();
  }
  void initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _token = "token";

  void setToken(String newValue) async {
    await _prefs.setString(_token, newValue);
  }

  String getToken() => _prefs.getString(_token);
}
