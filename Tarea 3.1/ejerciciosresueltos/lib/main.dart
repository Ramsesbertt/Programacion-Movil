import 'package:flutter/material.dart';
import 'package:ejerciciosresueltos/ejercicio1.dart';
import 'package:ejerciciosresueltos/ejercicio2.dart';
import 'package:ejerciciosresueltos/ejercicio3.dart';
import 'package:ejerciciosresueltos/ejercicio4.dart';
import 'package:ejerciciosresueltos/ejercicio5.dart';
import 'package:ejerciciosresueltos/ejercicio6.dart';
import 'package:ejerciciosresueltos/ejercicio7.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio2(),
    );
  }
}
