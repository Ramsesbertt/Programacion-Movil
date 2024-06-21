import 'package:flutter/material.dart';

class Persona {
  String _nombre;
  int _edad;
  String _dni;

  Persona({String nombre = '', int edad = 0, String dni = ''})
      : _nombre = nombre,
        _edad = edad,
        _dni = dni;

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set edad(int edad) {
    _edad = edad;
  }

  set dni(String dni) {
    _dni = dni;
  }

  String get nombre => _nombre;
  int get edad => _edad;
  String get dni => _dni;

  bool esMayorDeEdad() => _edad >= 18;

  String mostrar() {
    return 'Nombre: $_nombre\nEdad: $_edad\nDNI: $_dni\nMayor de edad: ${esMayorDeEdad() ? 'Sí' : 'No'}';
  }
}

class Ejercicio5 extends StatefulWidget {
  @override
  _Ejercicio5State createState() => _Ejercicio5State();
}

class _Ejercicio5State extends State<Ejercicio5> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  final _dniController = TextEditingController();
  String _resultado = '';
  Persona persona = Persona();

  void _mostrarDatos() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        persona.nombre = _nombreController.text;
        persona.edad = int.parse(_edadController.text);
        persona.dni = _dniController.text;
        _resultado = persona.mostrar();
      });
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _edadController.dispose();
    _dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 5 - Persona'),
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
                    Text('Ingrese los datos de la persona'),
                    TextFormField(
                      controller: _nombreController,
                      decoration: InputDecoration(labelText: 'Nombre'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un nombre';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _edadController,
                      decoration: InputDecoration(labelText: 'Edad'),
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
                      controller: _dniController,
                      decoration: InputDecoration(labelText: 'DNI'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese un DNI';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _mostrarDatos,
                      child: Text('Mostrar Datos'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Datos de la Persona:',
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
