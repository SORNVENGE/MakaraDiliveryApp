import 'package:flutter/material.dart';

InputDecoration buildInputDecoration( IconData icons, String hinttext) {
  return InputDecoration(
    prefixIcon:  Icon(
          icons,
          color: Colors.white70,
        ),
    labelText: hinttext,
    labelStyle: TextStyle(color: Colors.white70),
    hintStyle: TextStyle(color: Colors.white70),
    errorStyle: TextStyle(color: Colors.redAccent),
    focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.white70,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.only(25.0),
      borderSide: BorderSide(
        color: Colors.white70,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(width: 1, color: Colors.redAccent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(width: 1, color: Colors.redAccent),
    ),
  );
}
