import 'package:flutter/material.dart';

class Ejercicio7 extends StatefulWidget {
  @override
  _Ejercicio7State createState() => _Ejercicio7State();
}

class _Ejercicio7State extends State<Ejercicio7> {
  final TextEditingController _celsiusController = TextEditingController();
  String _resultado = '';

  void _calcularConversiones() {
    final double celsius = double.tryParse(_celsiusController.text) ?? 0;

    final double fahrenheit = (celsius * 9 / 5) + 32;
    final double kelvin = celsius + 273.15;

    setState(() {
      _resultado =
          'Fahrenheit: ${fahrenheit.toStringAsFixed(2)}\nKelvin: ${kelvin.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 7'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Grados Celsius'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularConversiones,
              child: Text('Calcular Fahrenheit y Kelvin'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
