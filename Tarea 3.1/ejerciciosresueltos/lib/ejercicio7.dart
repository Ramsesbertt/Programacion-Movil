import 'package:flutter/material.dart';

class Persona {
  String nombre;
  int edad;

  Persona({required this.nombre, required this.edad});

  bool esMayorDeEdad() => edad >= 18;
}

class Cuenta {
  Persona titular;
  double cantidad;

  Cuenta({required this.titular, this.cantidad = 0.0});

  void ingresar(double cantidad) {
    if (cantidad > 0) {
      this.cantidad += cantidad;
    }
  }

  void retirar(double cantidad) {
    if (cantidad > 0 && this.cantidad - cantidad >= 0) {
      this.cantidad -= cantidad;
    } else if (cantidad > 0 && this.cantidad - cantidad < 0) {
      this.cantidad = 0;
    }
  }
}

class CuentaJoven extends Cuenta {
  double bonificacion;

  CuentaJoven(
      {required Persona titular,
      double cantidad = 0.0,
      required this.bonificacion})
      : super(titular: titular, cantidad: cantidad);

  bool esTitularValido() {
    return titular.esMayorDeEdad() && titular.edad < 25;
  }

  @override
  void retirar(double cantidad) {
    if (esTitularValido()) {
      super.retirar(cantidad);
    }
  }

  @override
  String toString() {
    return 'Cuenta Joven\nTitular: ${titular.nombre}\nEdad: ${titular.edad}\nCantidad: S/ $cantidad\nBonificación: $bonificacion%';
  }
}

class Ejercicio7 extends StatefulWidget {
  @override
  _Ejercicio7State createState() => _Ejercicio7State();
}

class _Ejercicio7State extends State<Ejercicio7> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _bonificacionController = TextEditingController();
  final _retiroController = TextEditingController();
  String _resultado = '';
  late CuentaJoven cuentaJoven;

  void _crearCuentaJoven() {
    if (_formKey.currentState!.validate()) {
      final nombre = _nombreController.text;
      final edad = int.parse(_edadController.text);
      final cantidad = double.parse(_cantidadController.text);
      final bonificacion = double.parse(_bonificacionController.text);
      final titular = Persona(nombre: nombre, edad: edad);

      setState(() {
        cuentaJoven = CuentaJoven(
            titular: titular, cantidad: cantidad, bonificacion: bonificacion);
        _resultado = cuentaJoven.toString();
      });
    }
  }

  void _realizarRetiro() {
    if (cuentaJoven == null || !_formKey.currentState!.validate()) return;

    final cantidadRetiro = double.parse(_retiroController.text);
    setState(() {
      cuentaJoven.retirar(cantidadRetiro);
      _resultado = cuentaJoven.toString();
      if (!cuentaJoven.esTitularValido()) {
        _resultado +=
            '\n\nTitular no válido para retiros (Debe ser mayor de edad y menor de 25 años).';
      }
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _edadController.dispose();
    _cantidadController.dispose();
    _bonificacionController.dispose();
    _retiroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 7 - Cuenta Joven'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Crear Cuenta Joven'),
                    TextFormField(
                      controller: _nombreController,
                      decoration:
                          InputDecoration(labelText: 'Nombre del titular'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un nombre';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _edadController,
                      decoration:
                          InputDecoration(labelText: 'Edad del titular'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese una edad';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cantidadController,
                      decoration: InputDecoration(
                          labelText: 'Cantidad inicial en la cuenta'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese una cantidad inicial';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _bonificacionController,
                      decoration:
                          InputDecoration(labelText: 'Bonificación (%)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese la bonificación';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _crearCuentaJoven,
                      child: Text('Crear Cuenta Joven'),
                    ),
                    SizedBox(height: 20),
                    Text('Realizar Retiro'),
                    TextFormField(
                      controller: _retiroController,
                      decoration: InputDecoration(labelText: 'Monto a retirar'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un monto para retirar';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _realizarRetiro,
                      child: Text('Realizar Retiro'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Detalles de la Cuenta:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(_resultado),
            ],
          ),
        ),
      ),
    );
  }
}
