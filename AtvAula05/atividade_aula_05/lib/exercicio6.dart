import 'package:flutter/material.dart';

class Tarefa {
  String titulo;
  bool concluida;

  Tarefa({
    required this.titulo,
    this.concluida = false,
  });
}

class Exercicio6 extends StatefulWidget {
  const Exercicio6({super.key});

  @override
  State<Exercicio6> createState() => _Exercicio6State();
}

class _Exercicio6State extends State<Exercicio6> {
  final List<Tarefa> _tarefas = [
    Tarefa(titulo: 'Estudar Flutter'),
    Tarefa(titulo: 'Fazer exercícios da aula'),
    Tarefa(titulo: 'Revisar Widgets de Layout'),
    Tarefa(titulo: 'Praticar Responsividade'),
  ];

  void _mostrarDialogo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: const Text('Você está no App de Notas de Tarefas'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _marcarTodas() {
    setState(() {
      for (final tarefa in _tarefas) {
        tarefa.concluida = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 6 - Tarefas')),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogo,
        child: const Icon(Icons.info),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _marcarTodas,
                child: const Text('Marcar todas como concluídas'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = _tarefas[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Checkbox(
                      value: tarefa.concluida,
                      onChanged: (value) {
                        setState(() {
                          tarefa.concluida = value ?? false;
                        });
                      },
                    ),
                    title: Text(
                      tarefa.titulo,
                      style: TextStyle(
                        decoration: tarefa.concluida
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      tarefa.concluida ? 'Concluída' : 'Pendente',
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tarefa.concluida = !tarefa.concluida;
                        });
                      },
                      child: Text(tarefa.concluida ? 'Desmarcar' : 'Concluir'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}