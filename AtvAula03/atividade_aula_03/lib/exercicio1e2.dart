import 'package:flutter/material.dart';

class Exercicio1e2 extends StatelessWidget {
  String title = "Flutter is fun";

  Exercicio1e2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(title),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Row(
            children: [
              const SizedBox(width: 100),
              Container(
                width: 150,
                height: 150,
                color: Colors.deepOrange,
                padding: const EdgeInsets.all(10),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi Mom ', style: TextStyle(fontSize: 18)),
                    Text('🐣', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.phone, color: Colors.deepPurpleAccent),
                Text("call", style: TextStyle(color: Colors.deepPurpleAccent)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.airplanemode_active_outlined,
                  color: Colors.deepPurpleAccent,
                ),
                Text("route", style: TextStyle(color: Colors.deepPurpleAccent)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.share, color: Colors.deepPurpleAccent),
                Text("share", style: TextStyle(color: Colors.deepPurpleAccent)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}