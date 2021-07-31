import 'dart:convert';

import 'package:bpa_express_app/ui/services/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:shared_preferences/shared_preferences.dart';

class ApiState extends ChangeNotifier {
  Future login(
      {required Map body,
      required Function onSuccess,
      required Function onError}) async {
    try {
      Dio.Response response = await dio().post('http://167.71.196.236/api/login', data: json.encode(body));
      this._setStoredToken(response.data['data']['token'], response.data);
      onSuccess(response);
      notifyListeners();
    } catch (e) {
      onError(e);
    }
  }

  void _setStoredToken(token, data) async {
    SharedPreferences.getInstance().then((SharedPreferences res) {
      Map<String, dynamic> userData = data;
      res.setString('token', token);
      print(jsonEncode(userData['data']));
      res.setString('userData', jsonEncode(userData));
    });
  }
}
