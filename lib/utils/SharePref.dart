import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{


  final String id = "auth_token";

//set data into shared preferences like this
  Future<void> setQbId(int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(this.id, id);
  }

//get value from shared preferences
  Future<int> getQbId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? authToken;
    authToken = pref.getInt(id);
    return authToken!;
  }
}