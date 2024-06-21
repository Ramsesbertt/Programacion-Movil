// archivo: ejercicio3.dart
import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio3 extends StatefulWidget {
  @override
  _Ejercicio3State createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final TextEditingController _radioController = TextEditingController();
  String _resultado = '';

  void _calcular() {
    final double radio = double.tryParse(_radioController.text) ?? 0;
    final double area = pi * pow(radio, 2);
    final double longitud = 2 * pi * radio;

    setState(() {
      _resultado =
          'Área: ${area.toStringAsFixed(2)}\nLongitud: ${longitud.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _radioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Radio del círculo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: Text('Calcular Área y Longitud'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
