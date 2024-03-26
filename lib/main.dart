import 'package:flutter/material.dart';
import 'package:jokenpo/home.dart';

void main() {
  runApp(MaterialApp(
      debugShowMaterialGrid: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan)
      ),
      home: const Jokenpo(title: "leandraoApp")));
}
