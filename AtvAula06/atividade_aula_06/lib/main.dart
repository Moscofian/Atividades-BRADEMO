import 'package:atividade_aula_06/exercicio3.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exercicio3(), // O MaterialApp agora chama um novo widget
    );
  }
}