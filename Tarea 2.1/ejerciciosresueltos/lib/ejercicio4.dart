// archivo: ejercicio4.dart
import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio4 extends StatefulWidget {
  @override
  _Ejercicio4State createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final TextEditingController _ladoAController = TextEditingController();
  final TextEditingController _ladoBController = TextEditingController();
  final TextEditingController _ladoCController = TextEditingController();
  String _resultado = '';

  void _calcularArea() {
    final double ladoA = double.tryParse(_ladoAController.text) ?? 0;
    final double ladoB = double.tryParse(_ladoBController.text) ?? 0;
    final double ladoC = double.tryParse(_ladoCController.text) ?? 0;

    final double semiPerimetro = (ladoA + ladoB + ladoC) / 2;
    final double area = sqrt(semiPerimetro *
        (semiPerimetro - ladoA) *
        (semiPerimetro - ladoB) *
        (semiPerimetro - ladoC));

    setState(() {
      _resultado = 'Área del triángulo: ${area.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ladoAController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lado A'),
            ),
            TextField(
              controller: _ladoBController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lado B'),
            ),
            TextField(
              controller: _ladoCController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lado C'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularArea,
              child: Text('Calcular Área'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
