import 'package:atividade_aula_04/exercicio1.dart';
import 'package:atividade_aula_04/exercicio2.dart';
import 'package:atividade_aula_04/exercicio3.dart';

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
      // Comente/descomente para escolher a tela, depois dê um hot reload
      home: Exercicio1(), // O MaterialApp agora chama um novo widget
      // home: Exercicio2(),
      // home: Exercicio3(),
    );
  }
}