import 'package:flutter/material.dart';

class Contador {
  int contador;

  Contador() : contador = 0;

  Contador.conParametros(this.contador);

  int get getContador => contador;
  set setContador(int contador) => this.contador = contador;

  void incrementar() {
    contador++;
  }

  void decrementar() {
    contador--;
  }
}

class Ejercicio4 extends StatefulWidget {
  @override
  _Ejercicio4State createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final Contador _contador = Contador();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 4 - Contador'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contador: ${_contador.getContador}',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _contador.incrementar();
                    });
                  },
                  child: Text('Incrementar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _contador.decrementar();
                    });
                  },
                  child: Text('Decrementar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
