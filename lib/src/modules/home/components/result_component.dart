import 'package:flutter/material.dart';

class ResultComponent extends StatelessWidget {
  final String texto;

  const ResultComponent({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(16), child: Text(texto)),
    );
  }
}
