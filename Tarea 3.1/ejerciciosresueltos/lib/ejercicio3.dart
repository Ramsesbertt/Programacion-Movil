import 'package:flutter/material.dart';

class Cuenta {
  String nombre;
  String dni;
  double cantidad;

  Cuenta({
    required this.nombre,
    required this.dni,
    this.cantidad = 3000.00,
  });

  void ingreso(double monto) {
    if (monto > 0) {
      cantidad += monto;
    }
  }

  void reintegro(double monto, String servicio) {
    if (monto > 0 && monto <= cantidad) {
      cantidad -= monto;
    }
  }

  void transferencia(double monto, String numeroCuenta) {
    if (monto > 0 && monto <= cantidad) {
      cantidad -= monto;
    }
  }
}

class Ejercicio3 extends StatefulWidget {
  @override
  _Ejercicio3State createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final _formKeyIngreso = GlobalKey<FormState>();
  final _formKeyReintegro = GlobalKey<FormState>();
  final _formKeyTransferencia = GlobalKey<FormState>();
  final _montoIngresoController = TextEditingController();
  final _montoReintegroController = TextEditingController();
  final _montoTransferenciaController = TextEditingController();
  final _numeroCuentaController = TextEditingController();
  String _servicio = 'Agua';
  String _resultado = '';
  Cuenta cuenta = Cuenta(nombre: 'Juan Perez', dni: '12345678');

  void _realizarIngreso() {
    if (_formKeyIngreso.currentState!.validate()) {
      final monto = double.parse(_montoIngresoController.text);
      setState(() {
        cuenta.ingreso(monto);
        _resultado = 'Ingresaste S/ $monto. Nuevo saldo: S/ ${cuenta.cantidad}';
      });
    }
  }

  void _realizarReintegro() {
    if (_formKeyReintegro.currentState!.validate()) {
      final monto = double.parse(_montoReintegroController.text);
      setState(() {
        cuenta.reintegro(monto, _servicio);
        _resultado =
            'Pagaste S/ $monto por $_servicio. Nuevo saldo: S/ ${cuenta.cantidad}';
      });
    }
  }

  void _realizarTransferencia() {
    if (_formKeyTransferencia.currentState!.validate()) {
      final monto = double.parse(_montoTransferenciaController.text);
      final numeroCuenta = _numeroCuentaController.text;
      setState(() {
        cuenta.transferencia(monto, numeroCuenta);
        _resultado =
            'Transferiste S/ $monto a la cuenta $numeroCuenta. Nuevo saldo: S/ ${cuenta.cantidad}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 3 - Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Saldo actual: S/ ${cuenta.cantidad}'),
              SizedBox(height: 20),
              Form(
                key: _formKeyIngreso,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ingreso de Dinero'),
                    TextFormField(
                      controller: _montoIngresoController,
                      decoration:
                          InputDecoration(labelText: 'Monto a ingresar'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un monto';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: _realizarIngreso,
                      child: Text('Realizar Ingreso'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKeyReintegro,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Reintegro - Pago de Servicios'),
                    TextFormField(
                      controller: _montoReintegroController,
                      decoration: InputDecoration(labelText: 'Monto a pagar'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un monto';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: _servicio,
                      decoration: InputDecoration(labelText: 'Servicio'),
                      items: <String>['Agua', 'Luz'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _servicio = newValue!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _realizarReintegro,
                      child: Text('Realizar Reintegro'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKeyTransferencia,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transferencia de Dinero'),
                    TextFormField(
                      controller: _montoTransferenciaController,
                      decoration:
                          InputDecoration(labelText: 'Monto a transferir'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un monto';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Ingrese un número válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _numeroCuentaController,
                      decoration:
                          InputDecoration(labelText: 'Número de cuenta'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un número de cuenta';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: _realizarTransferencia,
                      child: Text('Realizar Transferencia'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(_resultado),
            ],
          ),
        ),
      ),
    );
  }
}
