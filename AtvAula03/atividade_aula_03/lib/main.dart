import 'package:atividade_aula_03/exercicio1e2.dart';
import 'package:atividade_aula_03/exercicio3.dart';
import 'package:atividade_aula_03/exercicio4.dart';
import 'package:atividade_aula_03/exercicio5.dart';

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
      home: Exercicio1e2(), // O MaterialApp agora chama um novo widget
      // home: Exercicio3(),
      // home: Exercicio4(),
      // home: Exercicio5(),
    );
  }
}