import 'package:flutter/material.dart';

class Persona {
  String nombre;
  int edad;
  String dni;

  Persona({required this.nombre, required this.edad, required this.dni});
}

class Cuenta {
  Persona titular;
  double cantidad;

  Cuenta({required this.titular, this.cantidad = 0.0});

  Persona get getTitular => titular;
  double get getCantidad => cantidad;

  void ingresar(double cantidad) {
    if (cantidad > 0) {
      this.cantidad += cantidad;
    }
  }

  void retirar(double cantidad) {
    this.cantidad -= cantidad;
  }

  void mostrar() {
    print('Titular: ${titular.nombre}');
    print('Cantidad: $cantidad');
  }
}

class Ejercicio6 extends StatefulWidget {
  @override
  _Ejercicio6State createState() => _Ejercicio6State();
}

class _Ejercicio6State extends State<Ejercicio6> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _ingresarController = TextEditingController();
  final _retirarController = TextEditingController();
  String _resultado = '';
  double _cantidad = 0.0;

  void _crearCuenta() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        final titular =
            Persona(nombre: _nombreController.text, edad: 0, dni: '');
        final cantidadInicial = _cantidadController.text.isEmpty
            ? 0.0
            : double.parse(_cantidadController.text);
        final cuenta = Cuenta(titular: titular, cantidad: cantidadInicial);
        _cantidad = cuenta.getCantidad;
        _resultado =
            'Cuenta creada para ${cuenta.getTitular.nombre} con \$${cuenta.getCantidad}';
      });
    }
  }

  void _ingresarDinero() {
    final cantidad = double.tryParse(_ingresarController.text) ?? 0.0;
    if (cantidad > 0) {
      setState(() {
        _cantidad += cantidad;
      });
    }
  }

  void _retirarDinero() {
    final cantidad = double.tryParse(_retirarController.text) ?? 0.0;
    if (cantidad > 0 && _cantidad >= cantidad) {
      setState(() {
        _cantidad -= cantidad;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 6 - Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Es obligatorio poner el nombre del titular';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cantidadController,
                decoration: InputDecoration(labelText: 'Cantidad inicial'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _crearCuenta,
                child: Text('Crear cuenta'),
              ),
              SizedBox(height: 20),
              Text(_resultado),
              SizedBox(height: 20),
              TextFormField(
                controller: _ingresarController,
                decoration: InputDecoration(labelText: 'Ingresar dinero'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: _ingresarDinero,
                child: Text('Ingresar'),
              ),
              TextFormField(
                controller: _retirarController,
                decoration: InputDecoration(labelText: 'Retirar dinero'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: _retirarDinero,
                child: Text('Retirar'),
              ),
              SizedBox(height: 20),
              Text('Cantidad en cuenta: \$$_cantidad'),
            ],
          ),
        ),
      ),
    );
  }
}
