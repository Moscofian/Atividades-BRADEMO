import 'package:flutter/material.dart';

class Exercicio2 extends StatelessWidget {
  const Exercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 2 - Responsivo'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _mobileLayout();
          }
          return _desktopLayout();
        },
      ),
    );
  }

  Widget _mobileLayout() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: Text(
            'Título',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Botão 1')),
            const SizedBox(width: 12),
            ElevatedButton(onPressed: () {}, child: const Text('Botão 2')),
          ],
        ),
        const SizedBox(height: 20),
        _itemLista('Dart'),
        _itemLista('JS'),
        _itemLista('PHP'),
        _itemLista('C++'),
      ],
    );
  }

  Widget _desktopLayout() {
    return Row(
      children: [
        SizedBox(
          width: 220,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Título',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: const Text('Botão 1')),
                const SizedBox(height: 12),
                ElevatedButton(onPressed: () {}, child: const Text('Botão 2')),
              ],
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _itemLista('Dart'),
              _itemLista('JS'),
              _itemLista('PHP'),
              _itemLista('C++'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemLista(String texto) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Center(
            child: Text(
              texto,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}