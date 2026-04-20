// Implemente o GridView no layout da imagem abaixo. Utilize as imagens que desejar (baixando-as ou buscando na Internet com Image.network(url)).

import 'package:flutter/material.dart';

class Exercicio1 extends StatelessWidget {
  const Exercicio1({super.key});

  static final List<Map<String, String>> itens = [
    {
      'titulo': 'Imagem 1',
      'imagem': 'https://picsum.photos/seed/img1/600/600',
    },
    {
      'titulo': 'Imagem 2',
      'imagem': 'https://picsum.photos/seed/img2/600/600',
    },
    {
      'titulo': 'Imagem 3',
      'imagem': 'https://picsum.photos/seed/img3/600/600',
    },
    {
      'titulo': 'Imagem 4',
      'imagem': 'https://picsum.photos/seed/img4/600/600',
    },
    {
      'titulo': 'Imagem 5',
      'imagem': 'https://picsum.photos/seed/img5/600/600',
    },
    {
      'titulo': 'Imagem 6',
      'imagem': 'https://picsum.photos/seed/img6/600/600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 1 - GridView')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: itens.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.82,
          ),
          itemBuilder: (context, index) {
            final item = itens[index];
            return Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      item['imagem']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      item['titulo']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}