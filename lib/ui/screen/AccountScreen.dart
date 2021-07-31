import 'package:bpa_express_app/ui/component/header.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: HeaderApp(title: "Account",)
      ),
      body: Container(
        child: Column(
          children: [
            Text("Hello Home screen")
          ],
        ),
      ),
    );
  }
}