import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  final title;
  const HeaderApp({Key? key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFEA422),
      centerTitle: false,
      leadingWidth: title=="Booking"?50:0,
      leading: title=="Booking"?
      GestureDetector(
        onTap: () {Navigator.of(context).pop();},
        child: Icon(Icons.arrow_back_ios),
      )
      :Container(child: null),
      title: Container( child: Text(title,style: TextStyle(fontSize: 20, fontFamily: 'bold'),)),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.description),
          onPressed: (){},
        ),
      ],
    );
  }
}
