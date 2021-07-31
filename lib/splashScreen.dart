import 'dart:convert';
import 'package:bpa_express_app/ui/MainScreen.dart';
import 'package:bpa_express_app/ui/screen/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onLoading();
  }

  void onLoading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var userData = json.decode(prefs.getString("userData").toString());
    if(userData!='' && userData!=null){
      print({"name________": userData['data']['name']});
      print({"role________": userData['data']['role']['id']});
    } 

      if (token == null || token == '') {
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainScreen()));
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFEA422),
          ),
        ),
      ),
    );
  }
}
