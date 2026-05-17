import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:provider/provider.dart';

class TarefaProvider extends ChangeNotifier {

  final Box _box = Hive.box('tasksBox');
  List<String> _tarefas = [];
  List<String> get tarefas => _tarefas;

  TarefaProvider() {
    final List<dynamic>? dadosSalvos = _box.get('listaTarefas');
    if (dadosSalvos != null) {
      _tarefas = List<String>.from(dadosSalvos);
    }
  }

  void adicionarTarefa(String novaTarefa) {
    if (novaTarefa.trim().isNotEmpty) {
      _tarefas.add(novaTarefa.trim());
      
      _box.put('listaTarefas', _tarefas);
      
      notifyListeners();
    }
  }

  void removerTarefa(int index) {
    _tarefas.removeAt(index);
    
    _box.put('listaTarefas', _tarefas);
    
    notifyListeners();
  }
}

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const TodoListScreen(),
    );
  }
}

// 3. INTERFACE GRÁFICA (UI)
class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas (Hive + Provider)'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // O Consumer envolve a área que contém o TextField e a ListView
      body: Consumer<TarefaProvider>(
        builder: (context, tarefaProvider, child) {
          return Column(
            children: [
              // Campo de entrada (TextField) e Botão de adicionar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: 'Digite uma nova tarefa...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        // Envia o texto para a lógica de adição do Provider
                        tarefaProvider.adicionarTarefa(textController.text);
                        textController.clear(); // Limpa o campo
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              
              // Divisor visual
              const Divider(height: 1),

              // Lista de tarefas Dinâmica (ListView)
              Expanded(
                child: tarefaProvider.tarefas.isEmpty
                    ? const Center(
                        child: Text(
                          'Nenhuma tarefa pendente! 🎉',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: tarefaProvider.tarefas.length,
                        itemBuilder: (context, index) {
                          final tarefaItem = tarefaProvider.tarefas[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            elevation: 1,
                            child: ListTile(
                              title: Text(
                                tarefaItem,
                                style: const TextStyle(fontSize: 16),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                                onPressed: () {
                                  // Executa a remoção segura pelo index através do Provider
                                  tarefaProvider.removerTarefa(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}