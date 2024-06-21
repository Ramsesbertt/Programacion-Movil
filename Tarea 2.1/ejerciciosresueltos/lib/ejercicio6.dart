// archivo: ejercicio6.dart
import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio6 extends StatefulWidget {
  @override
  _Ejercicio6State createState() => _Ejercicio6State();
}

class _Ejercicio6State extends State<Ejercicio6> {
  final TextEditingController _gradosController = TextEditingController();
  String _resultado = '';

  void _calcularConversiones() {
    final double gradosSexagesimales =
        double.tryParse(_gradosController.text) ?? 0;

    final double gradosCentesimales = gradosSexagesimales * 10 / 9;
    final double radianes = gradosSexagesimales * pi / 180;

    setState(() {
      _resultado =
          'Centesimales: ${gradosCentesimales.toStringAsFixed(2)}\nRadianes: ${radianes.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 6'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _gradosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Grados Sexagesimales'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularConversiones,
              child: Text('Calcular Centesimales y Radianes'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
