import 'package:flutter/material.dart';

class Exercicio4 extends StatelessWidget {
  const Exercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Image Example"),
      ),
      body: Center(
        child: Column(
          children: [

            // Imagem pato
            FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2018/11/19/05/53/animal-3824672_1280.jpg",
                width: 200,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 40),

            // Imagem peixe
            FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQv2X53B7GZW52F1qjLvPQVTct3mjg0GxtRWA&s",
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
            ),

          ],
        ),
      ),
    );
  }
}