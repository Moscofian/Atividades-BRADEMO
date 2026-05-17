import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contador extends ChangeNotifier {
  int _valor = 0;
  int get valor => _valor;

  void incrementar() {
    _valor++;
    notifyListeners();
  }

  void decrementar() {
    _valor--;
    notifyListeners();
  }
}

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuta as mudanças no Contador. Sempre que 'notifyListeners()' for chamado,
    // este widget ContadorScreen será reconstruído automaticamente.
    final contador = context.watch<Contador>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atividade 2: Contador (Provider)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Valor Atual:',
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            // Exibe o valor vindo do estado do Provider
            Text(
              '${contador.valor}',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botão Decrementar
                ElevatedButton.icon(
                  // context.read apenas chama o método sem ficar "escutando" mudanças, ideal para ações de clique
                  onPressed: () => context.read<Contador>().decrementar(),
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrementar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 20),
                // Botão Incrementar
                ElevatedButton.icon(
                  onPressed: () => context.read<Contador>().incrementar(),
                  icon: const Icon(Icons.add),
                  label: const Text('Incrementar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}