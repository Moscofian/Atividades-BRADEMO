import 'package:flutter/material.dart';

class Exercicio3 extends StatelessWidget {
  const Exercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Stack & Positioned Widget"),
      ),
      body: Center(
        child: Stack(
          children: [

            Positioned(
              left: 20,
              top: 20,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Green", style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

            Positioned(
              left: 60,
              top: 60,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Red", style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

            Positioned(
              left: 100,
              top: 100,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.purple,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Purple", style: TextStyle(color: Colors.white),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}