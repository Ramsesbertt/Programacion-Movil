import 'package:flutter/material.dart';
import 'package:ejerciciosresueltos/ejercicio1.dart';
import 'package:ejerciciosresueltos/ejercicio2.dart';
import 'package:ejerciciosresueltos/ejercicio3.dart';
import 'package:ejerciciosresueltos/ejercicio4.dart';
import 'package:ejerciciosresueltos/ejercicio5.dart';
import 'package:ejerciciosresueltos/ejercicio6.dart';
import 'package:ejerciciosresueltos/ejercicio7.dart';
import 'package:ejerciciosresueltos/ejercicio8.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio1()),
                );
              },
              child: Text('Ejercicio 1: Suma, Diferencia, Producto'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio2()),
                );
              },
              child: Text('Ejercicio 2: Calcular Sueldo con Aumentos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio3()),
                );
              },
              child: Text('Ejercicio 3: Área y Longitud de un Círculo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio4()),
                );
              },
              child: Text('Ejercicio 4: Área de un Triángulo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio5()),
                );
              },
              child: Text('Ejercicio 5: Distancia entre dos Puntos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio6()),
                );
              },
              child: Text('Ejercicio 6: Conversión de Grados'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio7()),
                );
              },
              child: Text('Ejercicio 7: Conversión de Temperatura'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ejercicio8()),
                );
              },
              child: Text('Ejercicio 8: Conversión de Segundos'),
            ),
          ],
        ),
      ),
    );
  }
}
