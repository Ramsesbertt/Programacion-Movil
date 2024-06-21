// archivo: ejercicio2.dart
import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget {
  @override
  _Ejercicio2State createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  final TextEditingController _sueldo1Controller = TextEditingController();
  final TextEditingController _sueldo2Controller = TextEditingController();
  final TextEditingController _sueldo3Controller = TextEditingController();
  String _resultado = '';

  void _calcularSueldos() {
    final double sueldo1 = double.tryParse(_sueldo1Controller.text) ?? 0;
    final double sueldo2 = double.tryParse(_sueldo2Controller.text) ?? 0;
    final double sueldo3 = double.tryParse(_sueldo3Controller.text) ?? 0;

    final double sueldoFinal1 = sueldo1 * 1.10;
    final double sueldoFinal2 = sueldo2 * 1.12;
    final double sueldoFinal3 = sueldo3 * 1.15;

    setState(() {
      _resultado = 'Sueldos finales:\n'
          'Empleado 1: \$${sueldoFinal1.toStringAsFixed(2)}\n'
          'Empleado 2: \$${sueldoFinal2.toStringAsFixed(2)}\n'
          'Empleado 3: \$${sueldoFinal3.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sueldo1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sueldo Empleado 1'),
            ),
            TextField(
              controller: _sueldo2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sueldo Empleado 2'),
            ),
            TextField(
              controller: _sueldo3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sueldo Empleado 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularSueldos,
              child: Text('Calcular Sueldos Finales'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
