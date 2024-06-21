import 'package:flutter/material.dart';

class Persona {
  String nombre;
  int edad;
  String dni;
  String sexo;
  double peso;
  double altura;

  Persona({
    required this.nombre,
    required this.edad,
    required this.dni,
    required this.sexo,
    required this.peso,
    required this.altura,
  }) {
    // Asegurar que el sexo es correcto
    comprobarSexo(sexo);
  }

  // Constructor por defecto
  Persona.defecto()
      : nombre = '',
        edad = 0,
        dni = '',
        sexo = 'H',
        peso = 0.0,
        altura = 0.0;

  // Constructor con nombre, edad y sexo, el resto por defecto
  Persona.basico({required this.nombre, required this.edad, required this.sexo})
      : dni = '',
        peso = 0.0,
        altura = 0.0 {
    comprobarSexo(sexo);
  }

  // Método para comprobar que el sexo introducido es correcto
  void comprobarSexo(String sexo) {
    if (sexo != 'H' && sexo != 'M') {
      this.sexo = 'H';
    }
  }

  int calcularIMC() {
    double imc = peso / (altura * altura);
    if (imc < 20) {
      return -1;
    } else if (imc >= 20 && imc <= 25) {
      return 0;
    } else {
      return 1;
    }
  }

  bool esMayorDeEdad() {
    return edad >= 18;
  }
}

class Ejercicio2 extends StatefulWidget {
  @override
  _Ejercicio2State createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  final _dniController = TextEditingController();
  final _sexoController = TextEditingController();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  String _resultadoIMC = '';
  String _resultadoMayorEdad = '';

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      final persona = Persona(
        nombre: _nombreController.text,
        edad: int.parse(_edadController.text),
        dni: _dniController.text,
        sexo: _sexoController.text,
        peso: double.parse(_pesoController.text),
        altura: double.parse(_alturaController.text),
      );

      setState(() {
        int imcResultado = persona.calcularIMC();
        _resultadoIMC = imcResultado == -1
            ? 'Por debajo del peso ideal'
            : imcResultado == 0
                ? 'En el peso ideal'
                : 'Sobrepeso';
        _resultadoMayorEdad = persona.esMayorDeEdad() ? 'Sí' : 'No';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 2 - Persona'),
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
                    return 'Ingrese el nombre';
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
                    return 'Ingrese la edad';
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
                    return 'Ingrese el DNI';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _sexoController,
                decoration: InputDecoration(labelText: 'Sexo (H/M)'),
                validator: (value) {
                  if (value!.isEmpty || (value != 'H' && value != 'M')) {
                    return 'Ingrese un sexo válido (H o M)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pesoController,
                decoration: InputDecoration(labelText: 'Peso (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el peso';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alturaController,
                decoration: InputDecoration(labelText: 'Altura (m)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese la altura';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Ingrese un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcular,
                child: Text('Calcular'),
              ),
              SizedBox(height: 20),
              Text('Resultado IMC: $_resultadoIMC'),
              Text('Mayor de Edad: $_resultadoMayorEdad'),
            ],
          ),
        ),
      ),
    );
  }
}
