import 'package:atividade_aula_05/exercicio1.dart';
import 'package:atividade_aula_05/exercicio2.dart';
import 'package:atividade_aula_05/exercicio3.dart';
import 'package:atividade_aula_05/exercicio4.dart';
import 'package:atividade_aula_05/exercicio5.dart';
import 'package:atividade_aula_05/exercicio6.dart';

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
      // home: Exercicio4(),
      // home: Exercicio5(),
      // home: Exercicio6(),
    );
  }
}