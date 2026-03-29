import 'package:flutter/material.dart';

class Exercicio1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define a cor de fundo padrão para todos os Scaffolds do app
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Exercício 1 - Tema Azul')),
        body: const Center(
          child: Text(
            'Fundo configurado como Azul via ThemeData',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}