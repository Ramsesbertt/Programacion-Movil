import 'package:flutter/material.dart';

class Cuenta {
  String titular;
  double cantidad;

  Cuenta({required this.titular, this.cantidad = 0.0});

  void ingresar(double cantidad) {
    if (cantidad > 0) {
      this.cantidad += cantidad;
    }
  }

  void retirar(double cantidad) {
    if (cantidad > 0) {
      this.cantidad -= cantidad;
      if (this.cantidad < 0) {
        this.cantidad = 0;
      }
    }
  }
}

class Ejercicio1 extends StatefulWidget {
  @override
  _Ejercicio1State createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  final Cuenta _cuenta = Cuenta(titular: "Ramses Roman");
  final TextEditingController _controller = TextEditingController();
  String _message = "";

  void _ingresar() {
    final double? cantidad = double.tryParse(_controller.text);
    if (cantidad != null) {
      _cuenta.ingresar(cantidad);
      setState(() {
        _message = "Ingresado: \$${cantidad.toStringAsFixed(2)}";
      });
    }
  }

  void _retirar() {
    final double? cantidad = double.tryParse(_controller.text);
    if (cantidad != null) {
      _cuenta.retirar(cantidad);
      setState(() {
        _message = "Retirado: \$${cantidad.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1 - Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Titular: ${_cuenta.titular}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Cantidad: \$${_cuenta.cantidad.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _ingresar,
                  child: Text('Ingresar'),
                ),
                ElevatedButton(
                  onPressed: _retirar,
                  child: Text('Retirar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
