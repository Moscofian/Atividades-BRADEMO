import 'package:flutter/material.dart';

class Exercicio5 extends StatelessWidget {
  const Exercicio5({super.key});

  Widget buttonSection(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.blue)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Flutter layout demo", textAlign: TextAlign.center,),
        )
      ),
      body: ListView(
        children: [

          // Image
          Image.network(
            "https://i0.wp.com/microtripping.com/wp-content/uploads/2016/10/dsc_0578.jpg?fit=1200%2C798&ssl=1",
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),

          // Row 1
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Oeschinen Lake Campground",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Kandersteg, Switzerland",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.star, color: Colors.red),
                const Text("41"),
              ],
            ),
          ),

          // Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

          // Text
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese "
              "Alps. Situated 1,578 meters above sea level, it is one of the "
              "larger Alpine Lakes. A gondola ride from Kandersteg, followed by "
              "a half-hour walk through pastures and pine forest, leads you to "
              "the lake, which warms to 20 degrees Celsius in the summer.",
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}