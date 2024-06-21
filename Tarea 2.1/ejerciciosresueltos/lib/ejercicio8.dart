import 'package:flutter/material.dart';

class Ejercicio8 extends StatefulWidget {
  @override
  _Ejercicio8State createState() => _Ejercicio8State();
}

class _Ejercicio8State extends State<Ejercicio8> {
  final TextEditingController _segundosController = TextEditingController();
  String _resultado = '';

  void _calcularTiempo() {
    final int segundos = int.tryParse(_segundosController.text) ?? 0;

    final int horas = segundos ~/ 3600;
    final int minutos = (segundos % 3600) ~/ 60;
    final int segundosRestantes = segundos % 60;

    setState(() {
      _resultado =
          'Horas: $horas\nMinutos: $minutos\nSegundos: $segundosRestantes';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 8'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _segundosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Segundos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularTiempo,
              child: Text('Calcular Horas, Minutos y Segundos'),
            ),
            SizedBox(height: 20),
            Text(_resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
