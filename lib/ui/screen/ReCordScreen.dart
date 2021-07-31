import 'package:bpa_express_app/ui/component/header.dart';
import 'package:flutter/material.dart';

class ReCordScreen extends StatefulWidget {
  @override
  _ReCordScreenState createState() => _ReCordScreenState();
}

class _ReCordScreenState extends State<ReCordScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: HeaderApp(title: "Records",)
      ),
      body: Container(
        child: Column(
          children: [
            Text("Record screen")
          ],
        ),
      ),
    );
  }
}