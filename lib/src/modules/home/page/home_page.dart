import 'package:app_cep/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/home_controller.dart';
import '../components/empty_component.dart';
import '../components/result_component.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Consulta CEP'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // CAMPO CEP
              TextField(
                controller: cepController,
                keyboardType: TextInputType.number,
                maxLength: 9,

                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final text = newValue.text.replaceAll('-', '');

                    if (text.length <= 5) {
                      return newValue.copyWith(text: text);
                    }

                    final newText =
                        '${text.substring(0, 5)}-${text.substring(5)}';

                    return TextEditingValue(
                      text: newText,
                      selection: TextSelection.collapsed(
                        offset: newText.length,
                      ),
                    );
                  }),
                ],
                onChanged: (value) => controller.cep = value,

                decoration: InputDecoration(
                  labelText: 'Digite o CEP',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // BOTÃO BUSCAR
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  controller.cep = cepController.text;
                  controller.buscarCep();
                },
                child: const Text('Buscar'),
              ),

              const SizedBox(height: 10),

              // BOTÃO HISTÓRICO
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/history');
                },
                child: const Text('Ver Histórico'),
              ),

              const SizedBox(height: 10),

              // OBSERVER
              Observer(
                builder: (_) {
                  if (controller.loading) {
                    return const CircularProgressIndicator();
                  }

                  if (controller.erro.isNotEmpty) {
                    return Text(
                      controller.erro,
                      style: const TextStyle(color: Colors.red),
                    );
                  }

                  return Column(
                    children: [
                      if (controller.resultado.isEmpty)
                        EmptyComponent()
                      else
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            controller.resultado,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                      const SizedBox(height: 10),

                      if (controller.lat != null && controller.lon != null)
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            controller.abrirMapa();
                          },
                          icon: Icon(Icons.map),
                          label: Text('Abrir no Mapa'),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
