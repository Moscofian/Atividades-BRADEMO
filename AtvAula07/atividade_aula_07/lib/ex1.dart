import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';


class Ex1 extends StatefulWidget {
  const Ex1({super.key});

  @override
  State<Ex1> createState() => _Ex1State();
}

class _Ex1State extends State<Ex1> {
  final Box _myBox = Hive.box('settingsBox');
  late bool _isRelaxMode;

  @override
  void initState() {
    super.initState();
    // Recupera o estado salvo. Se for a primeira vez abrindo o app, o padrão será 'true' (Modo Relax)
    _isRelaxMode = _myBox.get('isRelaxMode', defaultValue: true);
  }

  void _toggleMode() {
    setState(() {
      // Inverte o estado
      _isRelaxMode = !_isRelaxMode;

      // Salva o novo estado imediatamente no Hive
      _myBox.put('isRelaxMode', _isRelaxMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define as cores e textos com base no estado atual
    final Color backgroundColor = _isRelaxMode ? Colors.blue.shade700 : Colors.green.shade700;
    final String centralText = _isRelaxMode ? "Modo Relax" : "Modo Focado";
    final IconData buttonIcon = _isRelaxMode ? Icons.wb_sunny : Icons.bolt;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              centralText,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _toggleMode,
              icon: Icon(buttonIcon, color: backgroundColor),
              label: const Text(
                "Alternar Modo",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: backgroundColor, 
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}