import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/life_model.dart';

class AppSharedPref {
  final SharedPreferences prefs;

  AppSharedPref(this.prefs);

  static const lifeKey = 'LIFE_KEY';

  Future<void> writLife(LifeModel lifeModel) async {
    await prefs.setString(lifeKey, jsonEncode(lifeModel.toJson()));
  }

  LifeModel? getLife() {
    final raw = prefs.getString(lifeKey);
    if (raw != null) {
      return LifeModel.fromJson(jsonDecode(raw));
    } else {
      return null;
    }
  }
}
