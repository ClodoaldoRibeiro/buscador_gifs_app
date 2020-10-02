import 'package:flutter/material.dart';
import 'package:buscador_gifs_app/ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Bacador de GIFs",
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
    theme: _temaPadrao(),
  ));
}

ThemeData _temaPadrao() {
  return ThemeData(
      hintColor: Colors.white,
      primaryColor: Colors.white,
      bottomAppBarColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintStyle: TextStyle(color: Colors.white),
      ));
}
