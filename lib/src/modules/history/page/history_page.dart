import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/history_controller.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final controller = HistoryController();

  @override
  void initState() {
    super.initState();
    controller.carregarHistorico(); //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de CEPs')),
      body: Observer(
        builder: (_) {
          if (controller.ceps.isEmpty) {
            return const Center(child: Text('Nenhum CEP consultado'));
          }

          return ListView.builder(
            itemCount: controller.ceps.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(controller.ceps[index]));
            },
          );
        },
      ),
    );
  }
}
