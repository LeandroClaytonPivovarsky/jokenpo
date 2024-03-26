import 'package:flutter/material.dart';
import 'package:jokenpo/home.dart';

void main() {
  runApp(
    MaterialApp(
    debugShowMaterialGrid: false,
    theme: ThemeData(brightness:  Brightness.light,),
    home: const MyHomePage(title: "leandraoApp")));
}


