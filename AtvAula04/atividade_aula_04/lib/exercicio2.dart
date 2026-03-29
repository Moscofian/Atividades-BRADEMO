import 'package:flutter/material.dart';

class Exercicio2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Theme(
        // Sobrescreve o tema inicial apenas para esta subárvore
        data: ThemeData(scaffoldBackgroundColor: Colors.yellow),
        child: Scaffold(
          appBar: AppBar(title: const Text('Exercício 2 - Tema Sobrescrito')),
          body: const Center(
            child: Text('Este fundo é Amarelo, sobrescrevendo o Azul inicial.'),
          ),
        ),
      ),
    );
  }
}