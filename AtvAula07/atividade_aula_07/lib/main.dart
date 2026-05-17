import 'package:atividade_aula_07/ex1.dart';
import 'package:atividade_aula_07/ex2.dart';
import 'package:atividade_aula_07/ex3.dart';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  await Hive.openBox('settingsBox');
  await Hive.openBox('tasksBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Contador()),      // Provider do Ex2
        ChangeNotifierProvider(create: (context) => TarefaProvider()),// Provider do Ex3
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Comente/descomente para escolher a tela, depois dê um hot reload
      home: Ex1(), // O MaterialApp agora chama um novo widget
      // home: Ex2(),
      // home: Ex3(),
    );
  }
}