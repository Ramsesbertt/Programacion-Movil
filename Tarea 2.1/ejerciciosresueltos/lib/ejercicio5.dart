import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio5 extends StatefulWidget {
  @override
  _Ejercicio5State createState() => _Ejercicio5State();
}

class _Ejercicio5State extends State<Ejercicio5> {
  final TextEditingController _x1Controller = TextEditingController();
  final TextEditingController _y1Controller = TextEditingController();
  final TextEditingController _x2Controller = TextEditingController();
  final TextEditingController _y2Controller = TextEditingController();
  String _resultado = '';

  void _calcularDistancia() {
    final double x1 = double.tryParse(_x1Controller.text) ?? 0;
    final double y1 = double.tryParse(_y1Controller.text) ?? 0;
    final double x2 = double.tryParse(_x2Controller.text) ?? 0;
    final double y2 = double.tryParse(_y2Controller.text) ?? 0;

    final double distancia = sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2));

    setState(() {
      _resultado = 'Distancia: ${distancia.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 5'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _x1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'X1'),
            ),
            TextField(
              controller: _y1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Y1'),
            ),
            TextField(
              controller: _x2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'X2'),
            ),
            TextField(
              controller: _y2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Y2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularDistancia,
              child: Text('Calcular Distancia'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
