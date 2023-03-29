import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Phone extends ChangeNotifier{

  static const String key = 'action';

  Future<void> changePhone(String phoneAccess) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(key);
    await pref.setString(key, phoneAccess);
    notifyListeners();
  }

  Future<String> get readData async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? 'Номер не определен';
  }
}