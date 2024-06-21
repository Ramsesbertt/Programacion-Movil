import 'package:flutter/material.dart';

class Ejercicio1 extends StatefulWidget {
  @override
  _Ejercicio1State createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _resultado = '';

  void _calcular(String operacion) {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;
    double resultado;

    switch (operacion) {
      case 'suma':
        resultado = num1 + num2;
        break;
      case 'diferencia':
        resultado = num1 - num2;
        break;
      case 'producto':
        resultado = num1 * num2;
        break;
      default:
        resultado = 0;
        break;
    }

    setState(() {
      _resultado = 'El resultado de la $operacion es: $resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calcular('suma'),
                  child: Text('Sumar'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('diferencia'),
                  child: Text('Restar'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('producto'),
                  child: Text('Multiplicar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
