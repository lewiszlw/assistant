import 'package:flutter/material.dart';

class CommingSoonPage extends StatelessWidget {
  const CommingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TODO")),
      body: const Center(child: Text("Comming soon...", style: TextStyle(fontSize: 30),)),
    );
  }
}
